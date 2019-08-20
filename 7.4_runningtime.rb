def running_time(array)
	# write your code here
	counter = 0
	#print_bool = false
    array.each_with_index do |item, index|
        loop do
			if item >= array[index-1] || index ==0
				array[index] = item
				break
			end
            counter += 1
			array[index] = array[index-1]
			index -= 1
		end
	end
	counter
end
  
  puts running_time([2, 1, 3, 1, 2])
  # => 4