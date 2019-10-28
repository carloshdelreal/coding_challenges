# frozen_string_literal: true

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  max_length = 0

  (0..s.length - 1).each do |i|
    subs = []
    (i..s.length - 1).each do |j|
      if subs.include? s[j]
        break
      else
        subs << s[j]
      end
    end
    max_length = subs.length if subs.length > max_length
  end
  max_length
end

p length_of_longest_substring('asjrgapa')
