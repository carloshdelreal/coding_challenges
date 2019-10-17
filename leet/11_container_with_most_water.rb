def max_area(height)
  max_a = 0
  finish = height.length - 1
  (0..finish-1).each do |i|
      (i+1..finish).each do |j|
          sample = [height[i], height[j]].min * (j-i)
          max_a = sample if sample > max_a
      end
  end
  max_a
end

p max_area([1,8,6,2,5,4,8,3,7])