def anagram(s)
  return -1 if s.length.odd?
  
  s = s.split('')
  start = s.slice(0, s.length/2)
  final = s.slice(s.length/2, s.length)
  count_hash = {}
  start.each do |letter|
    count_hash[letter] += 1 if count_hash[letter]
    count_hash[letter] = 1 unless count_hash[letter]
  end
  final.each do |letter|
    count_hash[letter] -= 1 if count_hash[letter]
    count_hash[letter] = -1 unless count_hash[letter]
  end
  
  result = [0,0]
  count_hash.values.each do |x|
    next if x.zero?
    if x.positive?
      result[0] += x
    else
      result[1] += x
    end
  end
  result[0].abs == result[1].abs ? result[0] : -1
end

p anagram('aaabbb')
p anagram('ab')
p anagram('abc')
p anagram('mnop')
p anagram('xyyx')
p anagram('xaxbbbxx')
p anagram('asdfjoieufoa')
p anagram('fdhlvosfpafhalll')
p anagram('mvdalvkiopaufl')


# expected
# 3
# 1
# -1
# 2
# 0
# 1
# 3
# 5
# 5