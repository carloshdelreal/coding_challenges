def appears_most_times(array)
  # write your code here
  d = Hash.new
  most_times = 0
  key_most_times = nil
  array.each do |x|
    d[x] += 1 if d.has_key? x
    d[x] = 1 unless d.has_key? x
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

puts appears_most_times([4376, -345, -345, 4376, -345, 84945, 4376, -345, -26509, 4376, 84945, 84945, -26509, 896341, 4376])
# => 4376