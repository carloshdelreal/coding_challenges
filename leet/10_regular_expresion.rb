# frozen_string_literal: true

# Regex class
class Regex
  def is_match(s, p)
    p_arr = if p.class == String 
              expressions(p)
            else
              p.dup
            end

    result = valid_regex?(s, p_arr.dup)

    if result.nil?
      combinations = regex_combinations(p_arr)
      # p combinations
      combinations.each do |combination|
        result = is_match(s,combination)
        return result if result == true
      end
    end

    result
  end

  def valid_regex?(s, exp_arr)
    p exp_arr
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

    puts "curr_exp: #{curr_exp}, exp_arr: #{exp_arr}"
    curr_exp = exp_arr.shift while exp_arr[0].length == 2

    return true if exp_arr.empty? || curr_exp[0][0] == s[-1]

    nil
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

  def regex_combinations(expresions)
    combinations = []
    expresions.each_with_index do |item, index|
      if item.length == 2
        arr = expresions[0...index] + expresions[(index + 1)..-1]
        combinations.push(arr)
      end
    end
    combinations
  end
end
