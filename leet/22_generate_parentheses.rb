# frozen_string_literal: true

def generate_parenthesis(n)
  combinations(n).uniq
end

def combinations(n)
  if n == 1
    ['()']
  else
    c = combinations(n - 1).uniq
    c.map { |x| '(' + x + ')' } + c.map { |x| x + '()' } + c.map { |x| '()' + x }
  end
end
p generate_parenthesis(2)
p generate_parenthesis(3)
p ['((()))', '(()())', '(())()', '()(())', '()()()']
# p generate_parenthesis(4)
