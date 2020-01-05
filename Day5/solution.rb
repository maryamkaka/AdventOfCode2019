require_relative "Intcode"

# Part 1
puts " ----- Part 1 ----- "
puts "Case 1: #{Intcode.new([1,0,0,0,99]).run.memory}, Expected: [2, 0, 0, 0, 99]"
puts "Case 2: #{Intcode.new([2,3,0,3,99]).run.memory}, Expected: [2, 3, 0, 6, 99]"
puts "Case 3: #{Intcode.new([2,4,4,5,99,0]).run.memory}, Expected: [2, 4, 4, 5, 99, 9801]"
puts "Case 4: #{Intcode.new([1,1,1,4,99,5,6,0,99]).run.memory}, Expected: [30, 1, 1, 4, 2, 5, 6, 0, 99]"
puts "Case 4: #{Intcode.new([1101,100,-1,4,0]).run.memory}, Expected: [1101, 100, -1, 4, 99]"
puts "Case 5: #{Intcode.new([3,0,4,0,99]).run(30).outputs}, Expected: [30]"

data = File.read('input.txt').split(',').map{|x| x.to_i}.freeze
puts "Answer: #{Intcode.new(data).run(1).outputs}"

# Part 2
puts " ----- Part 2 ---- "
puts "Case 7 (input equals 8): #{Intcode.new([3,9,8,9,10,9,4,9,99,-1,8]).run(8).outputs}, Expected: [1]"
puts "Case 6 (input equals 8): #{Intcode.new([3,9,8,9,10,9,4,9,99,-1,8]).run(20).outputs}, Expected: [0]"
puts "Case 8 (input less than 8): #{Intcode.new([3,9,7,9,10,9,4,9,99,-1,8]).run(1).outputs}, Expected: [1]"
puts "Case 9 (input less than 8): #{Intcode.new([3,9,7,9,10,9,4,9,99,-1,8]).run(20).outputs}, Expected: [0]"
puts "Case 10 (input equals 8): #{Intcode.new([3,3,1108,-1,8,3,4,3,99]).run(8).outputs}, Expected: [1]"
puts "Case 11 (input equals 8): #{Intcode.new([3,3,1108,-1,8,3,4,3,99]).run(20).outputs}, Expected: [0]"
puts "Case 12 (input less than 8): #{Intcode.new([3,3,1107,-1,8,3,4,3,99]).run(1).outputs}, Expected: [1]"
puts "Case 13 (input less than 8): #{Intcode.new([3,3,1107,-1,8,3,4,3,99]).run(8).outputs}, Expected: [0]"
puts "Case 14: #{Intcode.new([
    3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,
    1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,
    999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99,
  ]).run(6).outputs}, Expected: [999]"