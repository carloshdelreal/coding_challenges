# frozen_string_literal: true

def find_pairs(array, k)
  # write your code here
  pairs = []

  array.each_with_index do |element, index|
    (0..index).each do |i|
      pairs << [array[i], element] if (element + array[i]) == k
    end
  end
  pairs
end

p find_pairs([1, 9, 11, 13, 2, 3, 7], 12)
# => [[1, 11], [9, 3]]

p find_pairs([-8, 7, 11, 8, 5, 9, 3, 6, 2, -9, 4], 0)
# => [[-8, 8], [9, -9]]

p find_pairs([17, -20, 21, -3, 33, 10, 6, -11, 19, 40, 11, 17, 56, 33, 72, 5, 1, 36, 51], 40)
# => [[21, 19], [-11, 51]]
