def is_int?(str)
  !!(str =~ /^[-+]?[1-9]([0-9]*)?$/)
end

def reset_units (numbers , res)
  amount_numbers = 0
  number_of_units = 0
  argument = numbers.pop
  last = argument.to_s(2).size - 1
  while number_of_units != res.to_i
    number_of_units += 1 if argument.to_s(2)[last - amount_numbers] == '1'
    amount_numbers += 1
  end
  (argument.to_s(2)[0..(last - amount_numbers)] + '0' * amount_numbers).to_i(base = 2)
end

def run
  numbers = []
  signs = []

  loop do
    number = gets.chomp

    if is_int?(number)
      numbers << number.to_i
    elsif number == '+' ||  '-' ||  '\ ' ||  '*' || '!'
      signs << number
      return p 'Input Error' if numbers.length < 2
      break if signs.size == numbers.size - 1
    else
      return p 'Input Error'
    end

  end

  res = numbers.pop
  for n in 0..signs.length - 1
    res =
        case signs[n]
          when '+'
            res + numbers.pop
          when '-'
            numbers.pop - res
          when '*'
            res * numbers.pop
          when '/'
            numbers.pop / res
          when '!'
            reset_units(numbers, res)
        end
  end
  p res
end

run
