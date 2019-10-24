def is_match(s, p)
  i = 0
  j = 0
  loop do
      puts "letter #{s[i]} expresion #{p[j]}"
      sleep(0.3)
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
  return (p[j+1].nil? ? (s[i].nil? ? true : false) : false)
end

p is_match("aa", "a")
p is_match("a", "a*")
p is_match("ab", ".*")
p is_match("aab", "c*a*b")
p is_match("missisippi", "mis*is*p*.")