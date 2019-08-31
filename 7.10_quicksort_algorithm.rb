# frozen_string_literal: true

def simple_quicksort(array)
  partition(array)
end

def partition(array)
  return array if array.length <= 1

  pivot = array.first
  left = []
  right = []
  array.each do |item|
    unless item == pivot
      item < pivot ? left << item : right << item
    end
  end
  arr = partition(left) + [pivot] + partition(right)
  puts arr.join(' ')
  arr
end

p simple_quicksort([5, 8, 1, 3, 7, 10, 2])
# => 2 3
#    1 2 3
#    7 8 10
#    1 2 3 5 7 8 10
