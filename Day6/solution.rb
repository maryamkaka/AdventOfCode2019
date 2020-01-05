require_relative "orbit_map.rb"


file = File.open('input.txt')
data = file.readlines.map(&:chomp).freeze
file.close

puts " ----- Part 1 ----- "
puts("Case 1: #{OrbitMap.new([ "COM)B", "B)C", "C)D", "D)E", "E)F", "B)G", "G)H", "D)I", "E)J", "J)K", "K)L"]).checksum}, Expected: 42")
puts "Answer: #{OrbitMap.new(data).checksum}"
