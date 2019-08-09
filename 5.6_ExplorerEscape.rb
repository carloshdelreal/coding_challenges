def get_nodes(maze, node=[0,0])
	nodes = []
	node_down = [node[0]+1,node[1]]
	node_right = [node[0], node[1]+1]
	#puts "Node: #{node} N_Down: #{node_down}, N_Right: #{node_right}"
	
	#node down
	if maze[0].length > node[0]+1
		#down
		nodes.push(node_down) if maze[node[0]+1][node[1]] != 1 && maze[node[0]+1][node[1]] != nil
	end
	if maze[0].length > node[1]
		nodes.push(node_right) if maze[node[0]][node[1]+1] != 1 && maze[node[0]][node[1]+1] != nil
	end
	nodes
end


def maze_escape(maze)
	# write your code here
	start = [0,0]
	visited = []
	
	q = Queue.new
	q.push(start)
	while q.length > 0
		poped = q.pop
		visited.push(poped)
		nodes = get_nodes(maze, poped)
		nodes.each do |n|
			q.push(n)
		end
	end
	visited.to_s
end
  
p maze_escape(
	[
		[0, 0, 0, 0, 0], 
		[0, 1, 0, 1, 0], 
		[0, 1, 0, 1, 1], 
		[0, 1, 0, 0, 0], 
		[0, 0, 0, 1, 9]
	]
)
# => [ 
#      [0, 0],
#      [1, 0],
#      [2, 0],
#      [2, 1],
#      [2, 2],
#      [2, 3],
#      [3, 3],
#      [4, 3],
#      [4, 4]
#    ]

# maze =
# 	[
# 		[0, 0, 0, 0, 0], 
# 		[0, 1, 0, 1, 0], 
# 		[0, 1, 0, 1, 1], 
# 		[0, 1, 0, 0, 0], 
# 		[0, 0, 0, 1, 9]
# 	]



# puts get_nodes(maze, node=[0,4]).to_s
# puts "[[1, 4]]"
# puts get_nodes(maze, node=[4,0]).to_s
# puts "[[4, 1]]"
#puts maze[2][4]