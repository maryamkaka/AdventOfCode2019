start_key = 193651
end_key = 649729

def is_valid(number, limit_repeat = false)
  digits = number.to_s.chars
  repeating_digit = false
  increasing = true

  digits.each_index do |idx|
    next if idx == 0

    if digits[idx-1] == digits[idx]
      repeating_digit = true
      if limit_repeat && digits[idx] == digits[idx+1]
        repeating_digit = false
        break
      end
    end

    if digits[idx-1].to_i > digits[idx].to_i
      increasing = false
      break
    end
  end

  repeating_digit && increasing
end


puts " ----- Part 1 ----- "
puts "Case 1: #{is_valid(111111)}"
puts "Case 2: #{is_valid(223450)}"
puts "Case 3: #{is_valid(123789)}"

total = (start_key .. end_key).reduce(0) do |count, value|
  count+=1 if is_valid(value)
  count
end
puts "Answer: #{total}"

puts " ----- Part 2 ----- "
puts "Case 1: #{is_valid(112233, true)}"
puts "Case 2: #{is_valid(123444, true)}"
puts "Case 3: #{is_valid(111122, true)}"

total = (start_key .. end_key).reduce(0) do |count, value|
  count+=1 if is_valid(value, true)
  count
end
puts "Answer: #{total}"
