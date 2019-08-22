def partition(array)

	pivot = array[0]
	left = []
	right = []
	array.each do |item|
		unless item == pivot
			pivot > item ? left << item : right << item
		end
	end
	{:left => left, :pivot => pivot, :right => right}

end

def sorted_parts?(parts)
	if parts[:left].length > 1
		return false
	end
	if parts[:right].length > 1
		return false
	end
	return true
end
def merge_parts(parts_array)
	root = parts_array.delete_at(0)


end

def simple_quicksort(array, parts_array = [])
	# write your code here
		parts = partition(array)
		parts_array.push parts
		simple_quicksort(parts[:left], parts_array) if parts[:left].length > 1
		simple_quicksort(parts[:right], parts_array) if parts[:right].length > 1
		
		merge_parts parts_array
    
end

#p partition([4, 5, 3, 9, 1])


p simple_quicksort([5, 8, 1, 3, 7, 10, 2])
# => 2 3
#    1 2 3
#    7 8 10
#    1 2 3 5 7 8 10