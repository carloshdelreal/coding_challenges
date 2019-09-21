# frozen_string_literal: true

def partition(arr, start, endpoint)
  i = start - 1
  pivot = arr[endpoint]
  (start..endpoint).each do |j|
    if arr[j] < pivot
      i += 1
      arr[i], arr[j] = arr[j], arr[i]
    end
  end
  arr[i + 1], arr[endpoint] = arr[endpoint], arr[i + 1]
  i + 1
end

def advanced_quicksort(arr, start = 0, endpoint = arr.length - 1)
  if start < endpoint
    pivot_index = partition(arr, start, endpoint)
    advanced_quicksort(arr, start, pivot_index - 1)
    advanced_quicksort(arr, pivot_index + 1, endpoint)
  end
end

def smallest_difference(array)
  # write your code here
  advanced_quicksort(array)
  pair = nil
  smallest_diff = nil
  array.each_with_index do |item, index|
    next if index == 0

    previous = array[index - 1]
    diff = (item - previous).abs
    smallest_diff ||= diff
    pair ||= [previous, item]

    if diff < smallest_diff
      smallest_diff = (item - previous).abs
      pair = [previous, item]
    end
  end
  pair
end

p smallest_difference([-20, -3_916_237, -357_920, -3_620_601, 7_374_819, -7_330_761, 30, 6_246_457, -6_461_594, 266_854])
# => [-20, 30]
