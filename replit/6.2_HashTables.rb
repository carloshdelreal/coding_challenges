# frozen_string_literal: true

def appears_most_times(array)
  # write your code here
  d = {}
  most_times = 0
  key_most_times = nil
  array.each do |x|
    d[x] += 1 if d.key? x
    d[x] = 1 unless d.key? x
    if d[x] > most_times
      most_times = d[x]
      key_most_times = x
    end
  end
  key_most_times
end

puts appears_most_times([1, 2, 3, 1, 5])
# => 1

puts appears_most_times([23, 43, 67, 88, 42, 35, 77, 88, 99, 11])
# => 88

puts appears_most_times([4376, -345, -345, 4376, -345, 84_945, 4376, -345, -26_509, 4376, 84_945, 84_945, -26_509, 896_341, 4376])
# => 4376
