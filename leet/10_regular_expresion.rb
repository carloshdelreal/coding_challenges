# frozen_string_literal: true

# Regex class
class Regex
  def is_match(string, regular_ex)
    reg = RegexRecursive.new

    reg.is_match(string, regular_ex)
  end

  def match(string, p_string)
    p_arr = if p_string.class == String
              expressions(p_string)
            else
              p_string.dup
            end

    result = valid_regex?(string, p_arr.dup)

    if result.nil?
      combinations = regex_combinations(p_arr)
      # puts "combinations: #{combinations}"
      combinations.each do |combination|
        result = is_match(string, combination)
        return result if result == true
      end
    end

    result
  end

  def valid_regex?(string, exp_arr)
    # puts "valid_regex: #{exp_arr}"
    curr_exp = exp_arr.shift
    (0..(string.length - 1)).each do |i|
      # puts "s: #{s[i]}, curr_exp: #{curr_exp}"
      return false if curr_exp.nil?

      if string[i] == curr_exp[0] || curr_exp[0] == '.'
        curr_exp = exp_arr.shift if curr_exp.length == 1
      elsif curr_exp.length == 2
        curr_exp = exp_arr.shift
        redo
      else
        return false
      end
    end
    # puts "exp_arr: #{exp_arr}, curr_exp: #{curr_exp}"
    if exp_arr.empty?
      return true if curr_exp.nil? || curr_exp.length != 1

      return false
    end

    return true if exp_arr.empty? || curr_exp[0][0] == string[-1]
    return true if curr_exp == '.*' && exp_arr[0] == string[-1]

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

class RegexRecursive
  def is_match(s, p)
    p_arr = expressions(p).reverse
    s_arr = s.split('').reverse

    regex_step(s_arr.dup, p_arr.dup)
  end
  def is_match1(s, p)
    p_arr = expressions(p).reverse
    s_arr = s.split('').reverse

    regex_step1(s_arr.dup, p_arr.dup)
  end
  def is_match2(s, p)
    p_arr = expressions(p).reverse
    s_arr = s.split('').reverse

    regex_step2(s_arr.dup, p_arr.dup)
  end

  def regex_step1(s_arr, p_arr)
    return true if s_arr.empty? && p_arr.empty?
    return false if p_arr.empty?

    curr_s = s_arr.pop
    curr_exp = p_arr.pop
    result1 = nil
    result2 = nil
    result3 = nil
    # puts "curr_s: #{curr_s}, curr_exp: #{curr_exp}"

    if curr_s == curr_exp[0] || (curr_exp[0] == '.' && !curr_s.nil?)
      result1 = regex_step(s_arr.dup, p_arr.dup)

      if curr_exp[1] == '*'
        result2 = regex_step(s_arr.dup, p_arr.dup + [curr_exp]) unless curr_exp.nil?
        result3 = regex_step(s_arr.dup + [curr_s], p_arr.dup) unless curr_s.nil?
      end
    elsif curr_s.nil?
      result1 = regex_step(s_arr.dup, p_arr.dup) if curr_exp[1] == '*'
    else
      result2 = regex_step(s_arr.dup + [curr_s], p_arr.dup)
    end
    [result1, result2, result3].any?
  end

  def regex_step2(s_arr, p_arr)
    return true if s_arr.empty? && p_arr.empty?
    return false if p_arr.empty?

    curr_s = s_arr.pop
    curr_exp = p_arr.pop
    result1 = nil
    result2 = nil
    result3 = nil
    # puts "curr_s: #{curr_s}, curr_exp: #{curr_exp}"

    if curr_s == curr_exp[0] || (curr_exp[0] == '.' && !curr_s.nil?)
      result1 = regex_step(s_arr.dup, p_arr.dup)

      if curr_exp[1] == '*'
        result2 = regex_step(s_arr.dup, p_arr.dup + [curr_exp]) unless curr_exp.nil?
        result3 = regex_step(s_arr.dup + [curr_s], p_arr.dup) unless curr_s.nil?
      end
    elsif curr_s.nil? && curr_exp[1] == '*'
      result1 = regex_step(s_arr.dup, p_arr.dup)
    elsif curr_exp[1] == '*'
      result2 = regex_step(s_arr.dup + [curr_s], p_arr.dup)
    end
    [result1, result2, result3].any?
  end

  def regex_step(s_arr, p_arr)
    return true if s_arr.empty? && p_arr.empty?
    return false if p_arr.empty?

    curr_s = s_arr.pop
    curr_exp = p_arr.pop
    result1 = nil
    result2 = nil
    puts "curr_s: #{curr_s}, curr_exp: #{curr_exp}"
    if curr_s.nil? && curr_exp[1] == '*'
      result1 = regex_step(s_arr.dup, p_arr.dup)
    elsif curr_exp[1] == '*' && (curr_s == curr_exp[0] || curr_exp[0] == '.')
      result1 = regex_step(s_arr.dup, p_arr.dup + [curr_exp])
    elsif curr_exp[1] == '*'
      result1 = regex_step(s_arr.dup + [curr_s], p_arr.dup) 
    elsif curr_s == curr_exp[0] || (curr_exp[0] == '.')
      result1 = regex_step(s_arr.dup, p_arr.dup)
    end

    # if curr_s == curr_exp[0] || (curr_exp[0] == '.' && !curr_s.nil?)
    #   result1 = regex_step(s_arr.dup, p_arr.dup)

    #   if curr_exp[1] == '*'
    #     result2 = regex_step(s_arr.dup, p_arr.dup + [curr_exp])
    #     result3 = regex_step(s_arr.dup + [curr_s], p_arr.dup)
    #   end
    # elsif curr_s.nil? && curr_exp[1] == '*'
    #   result1 = regex_step(s_arr.dup, p_arr.dup)
    # elsif curr_exp[1] == '*'
    #   result2 = regex_step(s_arr.dup + [curr_s], p_arr.dup)
    # end
    # [result1, result2].any?
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
    optimize_exp(expressions_arr)
  end

  def optimize_exp(arr)
    optimized = []
    arr.each do |item|
      next if optimized[-1] == item && item.length > 1

      optimized.push item
    end
    optimized
  end
end
