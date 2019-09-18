# frozen_string_literal: true


def partition(array, dis_left=(array.length/2)-1, dis_right=(array.length/2)-1)
  return array if array.length <= 1

  pivot = array.first
  left = []
  right = []
  array.each do |item|
    unless item == pivot
      item < pivot ? left << item : right << item
    end
  end
  puts "left: #{left.to_s}, pivot: #{pivot}, right: #{right.to_s}, dis_left: #{dis_left}, dis_right: #{dis_right}"
  
  if left.length <= dis_left
    dis_left = dis_left-left.length
    if dis_left == 0
      arr = [pivot] + partition(right, dis_left, dis_right)
      arr
    else
      dis_left -= 1
      arr = partition(right, dis_left, dis_right)
      arr
    end
  elsif right.length <= dis_right
    dis_right = dis_right-right.length
    if dis_right == 0
      arr = partition(left, dis_left, dis_right) + [pivot]
      arr
    else
      dis_right -= 1
      arr = partition(left, dis_left, dis_right)
      arr
    end
  else
    arr = partition(left+[pivot]+right, dis_left, dis_right)
    arr
  end
end

def median(array)
  # write your code here
  median_numbers = partition(array)
  if median_numbers.length == 2
    median_numbers.sum/2.0
  else
    median_numbers[1]
  end

end

puts median([0, 1, 2, 4, 6, 5, 3])
# => 3
