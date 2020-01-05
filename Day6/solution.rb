require_relative "orbit_map.rb"

file = File.open('input.txt')
data = file.readlines.map(&:chomp).freeze
file.close

puts " ----- Part 1 ----- "
puts("Case 1: #{OrbitMap.new([ "COM)B", "B)C", "C)D", "D)E", "E)F", "B)G", "G)H", "D)I", "E)J", "J)K", "K)L"]).checksum}, Expected: 42")
puts "Answer: #{OrbitMap.new(data).checksum}"

puts " ----- Part 2 ----- "
test_data = [ "COM)B", "B)C", "C)D", "D)E", "E)F", "B)G", "G)H", "D)I", "E)J", "J)K", "K)L", "K)YOU", "I)SAN"]
puts "Case 1: #{OrbitMap.new(test_data).orbital_transfer_distance("YOU", "SAN")}, Expected: 4"
puts "Answer: #{OrbitMap.new(data).orbital_transfer_distance("YOU", "SAN")}"
