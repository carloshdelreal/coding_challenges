# frozen_string_literal: true

def gameOfThrones(s)
  count_hash = {}
  s.split('').each do |letter|
    count_hash[letter] += 1 if count_hash[letter]
    count_hash[letter] = 1 unless count_hash[letter]
  end
  puts count_hash.to_s
  if s.length.even?
    count_hash.values.select(&:odd?).empty? ? 'YES' : 'NO'
  else
    count_hash.values.select(&:odd?).length == 1 ? 'YES' : 'NO'
  end
end

p gameOfThrones('ddcceefeeccdd')
p gameOfThrones('cdefghmnopqrstuvw')
p gameOfThrones('aaabbbb')
