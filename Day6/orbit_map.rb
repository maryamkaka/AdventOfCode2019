class OrbitMap
  attr_reader :checksum

  def initialize(map)
    @objects = []
    read_map(map)
    @checksum = get_checksum
  end

  def orbital_transfer_distance(obj1_name, obj2_name)
    obj1_path = get_body(obj1_name).get_path
    obj2_path = get_body(obj2_name).get_path

    intersection = obj1_path & obj2_path
    distance = obj1_path.find_index(intersection[0]) + obj2_path.find_index(intersection[0])
  end

  private

  attr_accessor :objects

  def read_map(map)
    map.each do | orbital |
      orbitting_body_name, body_name = orbital.split(")")

      orbitting_body = get_body(orbitting_body_name)
      if(orbitting_body == nil)
        orbitting_body = Body.new(orbitting_body_name)
        objects.push(orbitting_body)
      end

      body = get_body(body_name)
      if(body == nil)
        objects.push(Body.new(body_name, orbitting_body))
      else
        body.set_orbitting_body(orbitting_body)
      end
    end
  end

  def get_body(name)
    objects.find { | body | body.name == name }
  end

  def get_checksum
    objects.reduce(0) do | count, obj |
      count += obj.orbit_count
    end
  end
end

class Body
  attr_reader :name, :orbitting_body

  def initialize(name, orbitting_body = nil)
    @name = name
    set_orbitting_body(orbitting_body) if orbitting_body != nil
  end

  def set_orbitting_body(new_body)
    @orbitting_body = new_body
  end

  def get_path
    path = []
    orbit = orbitting_body
    while orbit != nil
      path.push(orbit.name)
      orbit = orbit.orbitting_body
    end
    path
  end

  def orbit_count
    count = 0

    orbit = orbitting_body
    while orbit != nil
      count += 1
      orbit = orbit.orbitting_body
    end

    count
  end
end
