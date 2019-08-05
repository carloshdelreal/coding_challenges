def graph_cycle?(graph)
  # write your code here
  visited = []
	stack = [0]
	while stack.length > 0
		poped = stack.pop
			visited.push(poped)
			nodes = graph[poped]
			
			if nodes.class == Array
				nodes.reverse!
				nodes.each do |n|
					stack.push(n) unless visited.any? n
				end
			end
	end
	visited.detect{ |e| visited.count(e) > 1 }  != nil
end
  
puts graph_cycle?({
	0=>[2], 
	1=>[4], 
	2=>[0, 5, 3], 
	3=>[5, 2], 
	4=>[5, 1], 
	5=>[4, 2, 3]
})
# => true

puts graph_cycle?({
	0=>[2], 
	1=>[2], 
	2=>[0, 1, 3, 4, 5], 
	3=>[2], 
	4=>[2]
})
# => false

puts graph_cycle?({
	0=>[1, 2], 
	1=>[0, 3, 4], 
	2=>[0, 5, 6], 
	3=>[1], 
	4=>[1], 
	5=>[2], 
	6=>[2]
})
# => false
