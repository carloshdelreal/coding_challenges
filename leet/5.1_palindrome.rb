# frozen_string_literal: true

def palindrome?(a, i, j)
  return true if j == i

  loop do
    break if i >= j
    return false if a[i] != a[j]

    i += 1
    j -= 1
  end
  # puts "Palindrome: #{a[start..finish]}, i: #{start}, j: #{finish}"
  true
end

def longest_palindrome(s)
  pal_len = 0
  pal_s = ''
  l = s.length
  a = s.split('')
  (0..l - 1).each do |i|
    (i..l).each do |j|
      next unless palindrome?(a, i, j)

      next unless a[i..j].length > pal_len

      # puts "i: #{i}, j:#{j}"
      pal_len = a[i..j].length
      pal_s = a[i..j].join('')
      # puts "Subs: #{a[i..j].join('')}, Leng: #{a[i..j-1].length}"
    end
  end
  pal_s
end

p longest_palindrome('aaabbb')
p longest_palindrome('aaabbbb')
p longest_palindrome('babad')
p longest_palindrome('ac')
p longest_palindrome('a')
# a = 'babad'.split('')
# p palindrome?(a , 0, 2)
# p a.slice(0,2).join('')
# p a.slice(0,2)
# p palindrome?('ac', 0, 1)
