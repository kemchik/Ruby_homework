def isint(str)
  return !!(str =~ /^[-+]?[1-9]([0-9]*)?$/)
end

def calculator
  numbers = []
  signs = []

  loop do
    number = gets.chomp
    if isint(number) == true
      numbers << number.to_f
    elsif number == '+' || number == '-' || number == '\ ' || number == '*'
      signs << number
      break if signs.size == numbers.size - 1
    else
      return p 'error'
    end
  end

  res = numbers.pop
  for n in 0..signs.length - 1
    if signs[n] == '+'
      res = res+ numbers.pop
    elsif signs[n] == '-'
      res = res - numbers.pop
    elsif signs[n] == '*'
      res = res * numbers.pop
    elsif signs[n] == '/'
      res = res / numbers.pop
    end
  end
  p res
end

calculator
