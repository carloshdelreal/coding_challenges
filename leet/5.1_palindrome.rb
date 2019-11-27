# frozen_string_literal: true

class Palindrome
  ## solution 1
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

  def longest_palindrome_1(s)
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

  ## Solution 2
  def posible_palindrome(string, seed)
    start_finish = seed
    while ((start_finish[0] - 1) >= 0) && ((start_finish[1] + 1) <= (string.length - 1))
      break unless string[start_finish[0] - 1] == string[start_finish[1] + 1]

      start_finish[0] -= 1
      start_finish[1] += 1
    end
    start_finish
  end

  def palindrome_starts(string)
    starts = []
    (0..(string.length)).each do |i|
      break if string[i + 1].nil?

      starts.push([i, i + 1]) if string[i] == string[i + 1]

      next if string[i + 2].nil?

      starts.push([i, i + 2]) if string[i] == string[i + 2]
    end
    starts
  end

  def longest_palindrome_2(string)
    return string if string.length <= 1

    seeds = palindrome_starts(string)

    return string[0..0] if seeds.empty?

    longitude = 0
    longest = []

    seeds.each do |seed|
      start_finish = posible_palindrome(string, seed)
      if (start_finish[1] - start_finish[0]) > longitude
        longitude = start_finish[1] - start_finish[0]
        longest = start_finish
      end
    end
    # puts "longest: #{longest}, string: #{string}, result: #{string[longest[0], longest[1] + 1]}"
    string[longest[0]..longest[1]]
  end

  ## mean solution
  def longest_palindrome_3(s)
    max = 1000
    l = s.length

    start = end_at = 0
    if l == 0
      return ''
    else
      (0..l - 1).each do |i|
        found1 = expandSearch(s, i, i)
        found2 = expandSearch(s, i, i + 1)
        len = [found1, found2].max
        if len > end_at - start
          start = i - (len - 1) / 2
          end_at = start + len - 1
        end
      end

      return s[start..end_at]
    end
  end

  def expandSearch(s, left, right)
    while left >= 0 && right < s.length && s[left] == s[right]
      left -= 1
      right += 1
    end

    right - left - 1
  end
end
