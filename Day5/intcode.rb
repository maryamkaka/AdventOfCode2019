class Intcode
  def initialize(instructions)
    @memory = instructions
    @pointer = 0
  end

  def run(inputs = nil, outputs = nil)
    while pointer != nil
      process_instructions
    end

    memory
  end

  private

  attr_accessor :pointer, :memory

  def process_instructions()
    instruction = memory[pointer]

    if instruction == 99
      @pointer = nil
      return
    end

    opcode, pos_mode1, pos_mode2, pos_mode3 = instruction.to_s.reverse.chars.map(&:to_i)
    param1 = pos_mode1 == 1 ? memory[pointer + 1] : memory[memory[pointer + 1]]
    param2 = pos_mode2 == 1 ? memory[pointer + 2] : memory[memory[pointer + 2]]
    param3 = pos_mode3 == 1 ? memory[pointer + 3] : memory[memory[pointer + 3]]

    puts "DE: #{opcode} C: #{param1}  B: #{param2}  A: #{param3} "

    case opcode
    when 1
      memory[memory[pointer + 3]] = param1 + param2
      @pointer += 4
    when 2
      memory[memory[pointer + 3]] = param1 * param2
      @pointer += 4
    when 3
      dest_pointer = memory[pointer + 1]
      memory[dest_pointer] = inputs
    else
      @pointer = nil
      raise "Unexpected opcode"
    end
  end

end