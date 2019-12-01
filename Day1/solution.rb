### Part 1 ###

file = File.open('input.txt')
data = file.readlines.map(&:chomp)
file.close

fuel = data.reduce(0) do |total, mass|
  total += (mass.to_i/3) - 2
end

puts "Total fuel requirement: #{fuel.to_s}"