def process_instructions(instructions)
  instructions.each_slice(4) do |opcode, pos1, pos2, dest|
    case opcode
    when 1
      instructions[dest] = instructions[pos1] + instructions[pos2]
    when 2
      instructions[dest] = instructions[pos1] * instructions[pos2]
    when 99
      break
    else
      raise "Unexpected opcode"
    end
  end

  instructions
end

puts "Case 1: #{process_instructions([1,0,0,0,99])}"
puts "Case 2: #{process_instructions([2,3,0,3,99])}"
puts "Case 3: #{process_instructions([2,4,4,5,99,0])}"
puts "Case 4: #{process_instructions([1,1,1,4,99,5,6,0,99])}"

data = File.read('input.txt').split(',').map{|x| x.to_i}.freeze

# Part 1
instructions = data.dup
instructions[1] = 12
instructions[2] = 2
instructions = process_instructions(instructions)
puts "Answer: #{instructions[0]}"

# Part 2
attempts = 99
attempts.times do |n|
  attempts.times do |v|
    instructions = data.dup
    instructions[1] = n
    instructions[2] = v

    if process_instructions(instructions)[0] == 19690720
      puts "Part 2: Answer: #{100 * n + v}"
      break
    end
  end
end
