def is_match(s, p)
  i = 0
  j = 0
  loop do
      puts "letter #{s[i]} expresion #{p[j]}"
      
      if s[i].nil? || p[j].nil?
          break
      elsif s[i] == p[j] || p[j] == '.'
          i += 1
          j += 1
      elsif p[j] == '*'
          if s[i] == p[j-1] || p[j-1] == '.'
              i += 1
          else
              j += 1
          end
      else 
        if p[j+2].nil?
          return false
        elsif p[j+1] == '*'
          j += 2
        end
      end        
  end
  remainder = p.slice(j..-1)
  puts "Remainder: #{remainder}, expression: #{p}"

  if p[j].nil? && s[i].nil?
    return true
  elsif remainder
    if p[j+1].nil? && p[j] == "*" || p[j+1] == "*"
      return true
    else
      skip = false
      remainder.each_char do |x|
        puts x
        unless skip
          skip = true unless x == s[-1]
        else
          skip = false
          return false unless x == "*"
        end
      end     
      return skip ? false : true
    end
  else
    return false
  end
end

# p is_match("aa", "a") # false
# p is_match("a", "a*") # true
# p is_match("ab", ".*") # true
# p is_match("aab", "c*a*b") #true
# p is_match("missisippi", "mis*is*p*.") #false
p is_match("aaa", "aaaa") #false
# p is_match("aaa", "a*a") # true
# p is_match("aaa", "ab*a*c*a") # true
# p is_match("ab", ".*c") # false
# p is_match("a", "ab*") # true