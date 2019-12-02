
file = File.open('input.txt')
data = file.readlines.map(&:chomp)
file.close

puts "    ----- Part 1 -----     "
fuel = data.reduce(0) do |total, mass|
  total += (mass.to_i/3) - 2
end
puts "Total fuel requirement: #{fuel.to_s}"


puts "     ----- Part 2 -----     "
def calculate_fuel(mass)
  feul = (mass/3).floor - 2
  feul += calculate_fuel(feul) if feul > 6
  feul
end
puts "Test 1969: #{calculate_fuel(1969).to_s}"
puts "Test 100756: #{calculate_fuel(100756).to_s}"

fuel = data.reduce(0) do |total, mass|
  total + calculate_fuel(mass.to_i)
end
puts "Total fuel requirement: #{fuel.to_s}"