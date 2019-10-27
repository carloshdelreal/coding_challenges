# frozen_string_literal: true

def is_valid(s)
  openings = { '(': ')', '[': ']', '{': '}' }
  # puts openings
  stack = []

  s.each_char do |x|
    # puts "X: #{x} openings: #{openings[x.to_sym]}"
    if openings[x.to_sym]
      stack.push(x)
    else
      p = stack.pop
      return false if p.nil?
      return false unless openings[p.to_sym] == x
    end
  end
  stack.empty? ? true : false
end

p is_valid('()[]{}')
p is_valid(']')
