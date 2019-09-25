# frozen_string_literal: true

def sort_itself(array)
  # write your code here
  print_bool = false
  array.each_with_index do |item, index|
    loop do
      if item > array[index - 1] || index == 0
        array[index] = item
        break
      end
      array[index] = array[index - 1]
      index -= 1
    end
    puts array.join(' ') if print_bool
    print_bool = true
  end
end

sort_itself([1, 4, 3, 6, 9, 2])
# => 1 4 3 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 2 3 4 6 9

sort_itself([9, 8, 6, 7, 3, 5, 4, 1, 2])
