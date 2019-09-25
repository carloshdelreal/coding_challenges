def merge_sort(array1, array2)
  # write your code here
  sorted_array = []
  loop do 
    #puts "Array1: #{array1}, Array2: #{array2}"
    if array1[0] == nil && array2[0] == nil
      break
    elsif array1[0] != nil && array2[0] == nil
      sorted_array.push(array1.shift)
    elsif array1[0] == nil && array2[0] != nil
      sorted_array.push(array2.shift)
    elsif array1[0] < array2[0]
      sorted_array.push(array1.shift)
    else
      sorted_array.push(array2.shift)
    end
  end
  sorted_array  
end

p merge_sort([1, 3, 9, 11], [2, 4, 6, 8])
# => [1, 2, 3, 4, 6, 8, 9, 11]

p merge_sort([-3, 2, 2, 2, 4], [-2, 0, 1, 5, 7])