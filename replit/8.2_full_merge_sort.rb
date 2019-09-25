# frozen_string_literal: true

def merge_sort(array1, array2)
  # write your code here
  sorted_array = []
  item1 = array1.shift
  item2 = array2.shift
  loop do
    if item1.nil? && item2.nil?
      break
    elsif !item1.nil? && item2.nil?
      sorted_array.push(item1)
      item1 = array1.shift
    elsif item1.nil? && !item2.nil?
      sorted_array.push(item2)
      item2 = array2.shift
    elsif item1.split(' ')[0] <= item2.split(' ')[0]
      sorted_array.push(item1)
      item1 = array1.shift
    else
      sorted_array.push(item2)
      item2 = array2.shift
    end
  end
  # p sorted_array.join(' ')
  sorted_array
end

def full(array)
  # write your code here
  return array if array.length == 1

  merge_sort(full(array.slice(0, array.length / 2)), full(array.slice(array.length / 2, array.length - 1)))
end

def full_merge_sort(array)
  result = full(array)
  result.each_with_index do |item, index|
    result[index] = item.split(' ')[1]
  end
  result
end

p full_merge_sort(['0 ab', '6 cd', '0 ef', '6 gh', '4 ij', '0 ab', '6 cd', '0 ef', '6 gh', '0 ij', '4 that', '3 be', '0 to', '1 be', '5 question', '1 or', '2 not', '4 is', '2 to', '4 the'])
# => ["ab", "ef", "ab", "ef", "ij", "to", "be", "or", "not", "to", "be", "ij", "that", "is", "the", "question", "cd", "gh", "cd", "gh"]
