class Wire
  attr_reader :segments, :x_max, :x_min, :y_max, :y_min

  def initialize(directions)
    @x_min = 0
    @x_max = 0
    @y_max = 0
    @y_min = 0
    @segments = extract_path(directions)
  end

  def self.find_intersections(wire1, wire2)
      poi = []
      wire1.segments.each do | wire1_segment |
        wire2.segments.each do | wire2_segment |
          poi.push(wire1_segment.find_poi(wire2_segment))
        end
      end
      poi.compact
    end

  private

  def extract_path(directions)
    current_point = [0,0]
    total_distance = 0

    directions.map do |path|
      direction = path[0]
      len = path[1, path.length].to_i

      segment = Segment.new()
      segment.start_point = Point.new(x: current_point[0], y: current_point[1])

      segment.distance_to = total_distance
      total_distance += len

      case direction
      when "R"
        current_point[0] += len
        segment.direction = :x
      when "L"
        current_point[0] -= len
        segment.direction = :x
      when "U"
        current_point[1] += len
        segment.direction = :y
      when "D"
        current_point[1] -= len
        segment.direction = :y
      else
        raise "Unexpected direction"
      end

      segment.end_point = Point.new(x: current_point[0], y: current_point[1])
      set_boundaries(current_point)

      segment
    end
  end

  def set_boundaries(point)
    @x_max = point[0] if point[0] > x_max
    @x_min = point[0] if point[0] < x_min
    @y_max = point[1] if point[1] > y_max
    @y_min = point[1] if point[1] < y_min
  end
end

class Point
  attr_accessor :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def ==(other)
    [x,y] == [other.x, other.y]
  end

  def to_s
    "(#{x}, #{y})"
  end

  def distance_to_point(point)
    Math.sqrt((point.x - x)**2 + (point.y - y)**2)
  end

  def manhattan_distance_to_origin
    x.abs + y.abs
  end
end

class Segment
  attr_accessor :start_point, :end_point, :direction, :distance_to

  def find_poi(other)
    if(direction != other.direction)
      possible_poi = Point.new(
        x: direction == :y ? start_point.x : other.start_point.x,
        y: direction == :x ? start_point.y : other.start_point.y,
      )

      if(point_on_segment?(possible_poi) && other.point_on_segment?(possible_poi))
        possible_poi
      end
    end
  end

  def point_on_segment?(point)
    between?(point.x, start_point.x, end_point.x) && between?(point.y, start_point.y, end_point.y)
  end

  private

  def between?(x, a, b)
    x.between?(a, b) || x.between?(b, a)
  end
end
