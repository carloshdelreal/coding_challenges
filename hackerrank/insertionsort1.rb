# frozen_string_literal: true

def insertionSort1(_n, arr)
  temp = arr[-1]
  (arr.length - 1).downto(0).each do |i|
    arr[i] = arr[i - 1] if i > 0
    if arr[i] < temp || i == 0
      arr[i] = temp
      break
    end
    puts arr.join(' ')
  end
  puts arr.join(' ')
end
p insertionSort1(2, [2, 4, 6, 8, 3])
