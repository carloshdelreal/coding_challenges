def anagram(s)
  return -1 if s.length.odd?
  s = s.split('')
  start = s.slice(0, s.length/2)
  final = s.slice(s.length/2, s.length)
  start.difference(final).length
  

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