def duplicates(arr1, arr2)
  # write your code here
  h = {}
  arr1.each do | item |
    h[item] ? h[item] -= 1 : h[item] = -1
  end
  
  arr2.each do | item |
    h[item] ? h[item] += 1 : h[item] = 1
  end

  extras = []
  h.each do |key, value|
    value.times do
      extras << key
    end
  end
  extras.sort()
end

p duplicates([203, 204, 205, 206, 207, 208, 203, 204, 205, 206], [203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 204, 205, 206])
# => [204, 205, 206]