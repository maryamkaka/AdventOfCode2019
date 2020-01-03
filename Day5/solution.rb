require_relative "Intcode"

# Part 1
puts "Case 1: #{Intcode.new([1,0,0,0,99]).run}, Expected: [2, 0, 0, 0, 99]"
puts "Case 2: #{Intcode.new([2,3,0,3,99]).run}, Expected: [2, 3, 0, 6, 99]"
puts "Case 3: #{Intcode.new([2,4,4,5,99,0]).run}, Expected: [2, 4, 4, 5, 99, 9801]"
puts "Case 4: #{Intcode.new([1,1,1,4,99,5,6,0,99]).run}, Expected: [30, 1, 1, 4, 2, 5, 6, 0, 99]"

data = File.read('input.txt').split(',').map{|x| x.to_i}.freeze


# Part 2
