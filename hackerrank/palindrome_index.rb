# frozen_string_literal: true

def palindromeIndex(s)
  a = s.split('')
  i = 0
  j = a.length - 1
  counter = 0
  loop do
    break if i >= j

    # puts "i: #{a[i]}, j: #{a[j]}"
    counter += 1 if a[i] != a[j]
    i += 1
    j -= 1
  end
  counter
end

p palindromeIndex('aaab')
p palindromeIndex('baa')
p palindromeIndex('aaa')

# Expected Output
# 3
# 0
# -1
