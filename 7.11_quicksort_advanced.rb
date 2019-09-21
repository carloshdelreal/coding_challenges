# frozen_string_literal: true

def advanced_quicksort(array)
  # write your code here

  loop do
    puts array.join(' ')
    return array if is_sorted?(array)

    partition(array)
  end
end

def is_sorted?(array)
  array.each_with_index do |item, index|
    next unless index > 0
    return false if item < array[index - 1]
  end
  true
end

def partition(array)
  return array unless array.length > 1

  pivot = array[-1]
  start = 0
  finish = array.length - 2
  count = 0

  loop do
    count += 1
    break if count > 10

    # puts "start: #{array[start]}, finish: #{array[finish]}"
    # puts array.join(' ')
    if start == finish
      temp = array[start]
      array[start] = pivot
      array[-1] = temp
      break
    end
    if array[start] > pivot && array[finish] < pivot
      temp = array[start]
      array[start] = array[finish]
      array[finish] = temp
      start += 1
      finish -= 1
    elsif array[start] < pivot
      start += 1
    elsif array[start] > pivot
      finish -= 1
    end
  end

  array
end

advanced_quicksort([1, 3, 9, 8, 2, 7, 5])
# => 1 3 2 5 9 7 8
#    1 2 3 5 9 7 8
#    1 2 3 5 7 8 9

# puts is_sorted?([1,2,3])
# puts is_sorted?([1,5,3])
