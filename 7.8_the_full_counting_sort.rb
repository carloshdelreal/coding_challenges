# frozen_string_literal: true

def simple_counting_sort(array)
  def counting_sort(array)
    count_array = [0] * 100
    array.each do |item|
      count_array[item.split(' ')[0].to_i] += 1
    end
    count_array
  end

  count_a = counting_sort(array)

  count_a.each_with_index do |item, index|
    count_a[index] = count_a[index - 1] + item if index > 0
  end

  # puts "Counts: #{count_a.to_s}"

  sorted_array = [0] * array.length
  array.reverse.each do |item|
    count_a[item.split(' ')[0].to_i] = count_a[item.split(' ')[0].to_i] - 1
    sorted_array[count_a[item.split(' ')[0].to_i]] = item.split(' ')[1]
  end
  sorted_array
end

def full_counting_sort(array)
  # write your code here
  simple_counting_sort(array)
end

p full_counting_sort(['0 ab', '6 cd', '0 ef', '6 gh', '4 ij', '0 ab', '6 cd', '0 ef', '6 gh', '0 ij', '4 that', '3 be', '0 to', '1 be', '5 question', '1 or', '2 not', '4 is', '2 to', '4 the'])
# => ["ab", "ef", "ab", "ef", "ij", "to", "be", "or", "not", "to", "be", "ij", "that", "is", "the", "question", "cd", "gh", "cd", "gh"]
