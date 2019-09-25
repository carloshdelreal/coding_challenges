# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    max_length = 0
    
    (0..s.length-1).each do |i|
      subs = []
      (i..s.length-1).each do |j|
        unless subs.include? s[j]
          subs << s[j]
        else
          break
        end
      end
      max_length = subs.length if subs.length > max_length
    end
    max_length
end

p length_of_longest_substring('asjrgapa')