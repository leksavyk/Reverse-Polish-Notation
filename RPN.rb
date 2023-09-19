if ARGV.length != 1
  puts("Enter: ruby RPN.rb 'expression'")
  puts("Note that the arguments of an expression must be separated by a space, for example '2 + 1 * 4'")
  exit
end

expression = ARGV[0].split
new_expression = []
operators = []
precedence = {'+' => 1, '-' => 1, '*' => 2, '/' => 2}

expression.each { |element|
  if element.match?(/^\d+(\.\d+)?\z/) #to check the number
    new_expression.push(element)
  elsif element == "("
    operators.push(element)
  elsif element == ")"
    while operators.last != "("
      new_expression.push(operators.pop)
    end
    operators.pop
  else
    while !operators.empty? && operators.last != "(" && precedence[operators.last] >= precedence[element]
      new_expression.push(operators.pop)
    end
    operators.push(element)
  end
}

until operators.empty?
  new_expression << operators.pop
end

puts("Input --> #{ARGV[0]}")
puts("Output --> #{new_expression.join(" ")}")
