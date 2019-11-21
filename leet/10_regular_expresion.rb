# frozen_string_literal: true

# Regex class
class Regex
  def is_match(s, p)
    exp_arr = expressions(p)
    # puts "exp_arr: #{exp_arr}"
    curr_exp = exp_arr.shift
    (0..(s.length - 1)).each do |i|
      # puts "s: #{s[i]}, curr_exp: #{curr_exp}"
      return false if curr_exp.nil?

      if s[i] == curr_exp[0] || curr_exp[0] == '.'
        curr_exp = exp_arr.shift if curr_exp.length == 1
      elsif curr_exp.length == 2
        curr_exp = exp_arr.shift
        redo
      else
        return false
      end
    end
    if exp_arr.empty?
      return true if curr_exp.nil? || curr_exp.length != 1

      return false
    end

    curr_exp = exp_arr.shift while exp_arr[0].length == 2
    puts "curr_exp: #{curr_exp} exp_arr: #{exp_arr}"
    # return false if curr_exp && exp_arr
    return true if exp_arr[0] == s[-1]

    exp_arr.all? { |x| x.length == 2 }
  end

  def expressions(string)
    expressions_arr = []
    (0..(string.length - 1)).each do |i|
      if string[i] == '*'
        expressions_arr[-1] += '*'
        next
      else
        expressions_arr.push(string[i])
      end
    end
    expressions_arr
  end
end
