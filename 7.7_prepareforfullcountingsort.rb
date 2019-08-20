def simple_counting_sort(array)
	# return the count_array
	def counting_sort(array)
		count_array = [0]*100
		array.each do |item|
			#puts item[0].to_i
			count_array[item.split(" ")[0].to_i] += 1
		end
		count_array
	end
	
	count_a = counting_sort(array)
	
	#puts count_a.to_s

	count_a.each_with_index do | item, index |
		if index > 0
			count_a[index] = count_a[index-1] + item
		end
	end

	#puts "Counts: #{count_a.to_s}"
	count_a

	# sorted_array = [0]*array.length
	# array.each do | item |
	# 	count_a[item] = count_a[item]-1
	# 	sorted_array[count_a[item]] = item
	# end
	# sorted_array
	
	
end

def full_counting_sort_prep(array)
	# write your code here
	simple_counting_sort(array)

end

p full_counting_sort_prep(["4 that", "3 be", "0 to", "1 be", "5 question", "1 or", "2 not", "4 is", "2 to", "4 the"])
# => [1, 3, 5, 6, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]