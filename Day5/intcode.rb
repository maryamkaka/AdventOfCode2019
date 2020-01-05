class Intcode
  attr_reader :outputs, :memory

  def initialize(instructions)
    @memory = instructions.dup
    @pointer = 0
    @outputs =[]
  end

  def run(input = nil)
    @input = input

    while pointer != nil
      process_instructions
    end

    self
  end

  private

  attr_writer :outputs, :memory
  attr_accessor :pointer

  def process_instructions()
    rasie "Something bad happened. Invalid instruction" if @pointer > memory.length

    instruction = memory[pointer].to_s.chars
    opcode = instruction.pop(2).join.to_i
    mode1, mode2, mode3 = instruction.reverse.map(&:to_i)

    case opcode
    when 1
      dest_pointer = memory[pointer + 3]
      memory[dest_pointer] = get_parameter_value(1, mode1) + get_parameter_value(2, mode2)
      @pointer += 4
    when 2
      dest_pointer = memory[pointer + 3]
      memory[dest_pointer] = get_parameter_value(1, mode1) * get_parameter_value(2, mode2)
      @pointer += 4
    when 3
      dest_pointer = memory[pointer + 1]
      memory[dest_pointer] = @input
      @pointer +=2
    when 4
      outputs.push(get_parameter_value(1, mode1))
      @pointer +=2
    when 99
      @pointer = nil
      return
    else
      @pointer = nil
      raise "Unexpected opcode"
    end
  end

  def get_parameter_value(param_idx, mode = nil)
    mode != nil && mode == 1 ? memory[pointer + param_idx] : memory[memory[pointer + param_idx]]
  end

end