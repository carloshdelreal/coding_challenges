# frozen_string_literal: true

def partition(array)
  # write your code here

  pivot = array.delete_at(0)
  left = []
  right = []
  array.each do |item|
    pivot > item ? left << item : right << item
  end
  left + [pivot] + right
end

p partition([4, 5, 3, 9, 1])
# => [3, 1, 4, 5, 9]
