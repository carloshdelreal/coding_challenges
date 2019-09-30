def quicksort(arr, start = 0, endpoint = arr.length - 1)
  return unless start < endpoint
  
  pivot_index = partition(arr, start, endpoint)
  quicksort(arr, start, pivot_index - 1)
  quicksort(arr, pivot_index + 1, endpoint)
  arr
end

def partition(arr, start, endpoint)
  # puts "low #{low}, high #{high}"
  i = start - 1 # -1   index of smaller element
  pivot = arr[endpoint] # 5  pivot - last element of the array
  (start..endpoint).each do |j|
    # If current element is smaller than the pivot
    next unless arr[j] < pivot

    # increment index of smaller element
    i += 1 # => 0
    # puts "i #{i}, j #{j}, arr[i] #{arr[i]}, arr[j] #{arr[j]}"
    arr[i], arr[j] = arr[j], arr[i] # swap elements
  end
  arr[i + 1], arr[endpoint] = arr[endpoint], arr[i + 1] # here we place the pivot in the correct position
  # so all smaller elements are to the left of pivot
  # and greater elements are to the right of pivot
  i + 1
end

def findMedian(arr)
  arr = quicksort(arr)
  if arr.length.odd?
    return arr[arr.length/2]
  else
    return (arr[arr.length/2 - 1] + arr[arr.length/2])/2.0
  end
end

p findMedian([1,2,3,4,5,6,7,8])
p findMedian([1,2,3,4,5,6,7])