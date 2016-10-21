def is_int?(str)
  !!(str =~ /^[-+]?[1-9]([0-9]*)?$/)
end

def if_! (numbers , res)
  count = 0
  count2 = 0
  argument = numbers.pop
  last = argument.to_s(2).size - 1
   while count2 != res.to_i
    count2 += 1 if argument.to_s(2)[last - count] == '1'
    count += 1
  end
  (argument.to_s(2)[0..(last - count)] + '0' * count).to_i(base = 2)
end

def to_calc
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
            if_!(numbers, res)
        end
  end
  
  p res
end

to_calca
