# frozen_string_literal: true

def simple_counting_sort(array)
  # return the count_array
  def counting_sort(array)
    count_array = [0] * 100
    array.each do |item|
      count_array[item] += 1
    end
    count_array
  end

  count_a = counting_sort(array)

  count_a.each_with_index do |item, index|
    count_a[index] = count_a[index - 1] + item if index > 0
  end

  # puts "Counts: #{count_a.to_s}"

  sorted_array = [0] * array.length
  array.each do |item|
    count_a[item] = count_a[item] - 1
    sorted_array[count_a[item]] = item
  end
  sorted_array
end

p simple_counting_sort([63, 25, 73, 1, 98, 73, 56, 84, 86, 57, 16, 83, 8, 25, 81, 56, 9, 53, 98, 67, 99, 12, 83, 89, 80, 91, 39, 86, 76, 85, 74, 39, 25, 90, 59, 10, 94, 32, 44, 3, 89, 30, 27, 79, 46, 96, 27, 32, 18, 21, 92, 69, 81, 40, 40, 34, 68, 78, 24, 87, 42, 69, 23, 41, 78, 22, 6, 90, 99, 89, 50, 30, 20, 1, 43, 3, 70, 95, 33, 46, 44, 9, 69, 48, 33, 60, 65, 16, 82, 67, 61, 32, 21, 79, 75, 75, 13, 87, 70, 33])
# => [1, 1, 3, 3, 6, 8, 9, 9, 10, 12, 13, 16, 16, 18, 20, 21, 21, 22, 23, 24, 25, 25, 25, 27, 27, 30, 30, 32, 32, 32, 33, 33, 33, 34, 39, 39, 40, 40, 41, 42, 43, 44, 44, 46, 46, 48, 50, 53, 56, 56, 57, 59, 60, 61, 63, 65, 67, 67, 68, 69, 69, 69, 70, 70, 73, 73, 74, 75, 75, 76, 78, 78, 79, 79, 80, 81, 81, 82, 83, 83, 84, 85, 86, 86, 87, 87, 89, 89, 89, 90, 90, 91, 92, 94, 95, 96, 98, 98, 99, 99]
