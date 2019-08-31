# frozen_string_literal: true

def hash_to_arr(hash_table)
  arr = []
  (0..10).each do |i|
    # puts "key: #{key}, values: #{values}"
    arr += hash_table[i] unless hash_table[i].nil?
  end
  arr
end

def hash_table(arr)
  # write your code here
  hash = {}
  arr.each do |item|
    key = item.abs % 11
    hash.key?(key) ? hash[key] << item : hash[key] = [item]
  end
  hash_to_arr(hash)
end

p hash_table([12, 24, 125, 5, 91, 1106, 2, 1021, 29, 3536, 10])
# => [12, 24, 2, 91, 125, 5, 3536, 1106, 29, 1021, 10]

p hash_table([2, 341, 73, 8265, 234_004, 602, 7_400_000, 200_000_000])
# => [341, 234004, 2, 200000000, 7400000, 8265, 73, 602]
