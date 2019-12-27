require_relative "wire"


def find_center(wire1, wire2)
  x_max = [wire1.x_max, wire2.x_max].max
  x_min = [wire1.x_min, wire2.x_min].min
  y_max = [wire1.y_max, wire2.y_max].max
  y_min = [wire1.y_min, wire2.y_min].min

  Point.new(
    x: (x_max - x_min) / 2,
    y: (y_max - y_min) / 2,
  )
end

def closest_point(wire1, wire2)
  center = find_center(wire1, wire2)
  intersections = Wire.find_intersections(wire1, wire2).select{ |x| x != Point.new(x: 0, y: 0) }
  distances = intersections.map{ |x| x.manhattan_distance_to_origin }
  min_distance, index = distances.each_with_index.min

  intersections[index]
end


puts " ----- Part 1 ----- "
wire_one = Wire.new("R8,U5,L5,D3".split(','))
wire_two = Wire.new("U7,R6,D4,L4".split(','))
puts "Case 1: #{closest_point(wire_one, wire_two).manhattan_distance_to_origin}"

wire_one = Wire.new("R75,D30,R83,U83,L12,D49,R71,U7,L72".split(","))
wire_two = Wire.new("U62,R66,U55,R34,D71,R55,D58,R83".split(","))
puts "Case 2: #{closest_point(wire_one, wire_two).manhattan_distance_to_origin}"

wire_one = Wire.new("R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51".split(","))
wire_two = Wire.new("U98,R91,D20,R16,D67,R40,U7,R15,U6,R7".split(","))
puts "Case 3: #{closest_point(wire_one, wire_two).manhattan_distance_to_origin}"

# Solution
file = File.open('input.txt')
data = file.readlines.map(&:chomp)
file.close

wire_one = Wire.new(data[0].split(','))
wire_two = Wire.new(data[1].split(','))
puts "Answer: #{closest_point(wire_one, wire_two).manhattan_distance_to_origin}"


