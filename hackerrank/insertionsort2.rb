# frozen_string_literal: true

def insertionSort2(n, arr)
  a = insertionSort(n, arr, 0)
  (1..n - 1).each do |i|
    a = insertionSort(n, a, i)
    puts a.join(' ')
  end
  a
end

def insertionSort(_n, arr, temp_index)
  temp = arr[temp_index]
  temp_index.downto(0).each do |i|
    arr[i] = arr[i - 1] if i.positive?
    if arr[i] < temp || i.zero?
      arr[i] = temp
      break
    end
  end
  arr
end

insertionSort2(6, [1, 4, 3, 5, 6, 2])
