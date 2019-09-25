# frozen_string_literal: true

def insertion_sort(array)
  # write your code here
  index = array.length - 1
  item = array[index]
  loop do
    if item > array[index - 1] || index == 0
      array[index] = item
      break
    end
    array[index] = array[index - 1]
    puts array.join(' ')
    index -= 1
  end

  puts array.join(' ')
end

insertion_sort([1, 3, 2])
# => 1 3 3
#    1 2 3

puts '-' * 20

insertion_sort([1, 4, 6, 9, 3])
# => 1 4 6 9 9
#    1 4 6 6 9
#    1 4 4 6 9
#    1 3 4 6 9

puts '-' * 20

insertion_sort([2, 3, 4, 5, 6, 7, 8, 9, 10, 1])
