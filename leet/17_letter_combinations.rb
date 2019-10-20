# frozen_string_literal: true

def letter_combinations(digits)
  letters = {
    2 => %w[a b c],
    3 => %w[d e f],
    4 => %w[g h i],
    5 => %w[j k l],
    6 => %w[m n o],
    7 => %w[p q r s],
    8 => %w[t u v],
    9 => %w[w x y z]
  }
  d = digits.split('')
  result = []
  d.each do |x|
    if result.empty?
      result += letters[x.to_i]
    else
      # puts "x: #{x} letters: #{letters[x.to_i]}"
      len = result.length
      result *= letters[x.to_i].length
      # puts "Result: #{result}"
      l = []
      letters[x.to_i].each do |y|
        l += [y] * len
      end
      result.each_index do |i|
        # puts "result #{result[i]} l: #{l[i]} : "
        result[i] = result[i] + l[i]
      end
    end
  end
  result
end

p letter_combinations('23')
p letter_combinations('234')
p letter_combinations('534')
