# frozen_string_literal: true

def max_area_logn(height)
  max_a = 0
  finish = height.length - 1
  (0..finish - 1).each do |i|
    (i + 1..finish).each do |j|
      sample = [height[i], height[j]].min * (j - i)
      max_a = sample if sample > max_a
    end
  end
  max_a
end

def max_area(height)
  max_a = 0
  start = 0
  finish = height.length - 1
  loop do
    break if finish <= start

    distance = finish - start
    sample = [height[start], height[finish]].min * distance
    max_a = sample if sample > max_a
    if height[start] > height[finish]
      finish -= 1
    else
      start += 1
    end
  end
  max_a
end

p max_area([1, 8, 6, 2, 5, 4, 8, 3, 7])
