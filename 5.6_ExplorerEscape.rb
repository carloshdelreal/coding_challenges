def get_nodes(maze, node=[0,0])
	nodes = []
	node_right = [node[0]+1,node[1]]
	node_down = [node[0], node[1]+1]
	
	#node down
	if maze.length > node[1]+1
		#down
		nodes.push(node_down) if maze[node[1]+1][node[0]] != 1 && maze[node[1]+1][node[0]] != nil
	end
	if maze[0].length > node[0]
		nodes.push(node_right) if maze[node[1]][node[0]+1] != 1 && maze[node[1]][node[0]+1] != nil
	end
	nodes
end


def maze_escape(maze)
	# write your code here
	start = [0,0]

	q = Queue.new
	q.push([start])
	while q.length > 0
		poped = q.pop

		nodes = get_nodes(maze, poped[-1])
		nodes.each do |n|
			if maze[n[1]][n[0]] == 9
				poped.push(n)	
				return poped
			end
			c = poped.clone
			c.push(n)
			q.push(c)
		end
	end
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


# => [[0, 0],[1, 0],[2, 0],[2, 1],[2, 2],[2, 3],[3, 3],[4, 3],[4, 4]]

maze =
	[
		[0, 0, 0, 0, 0], 
		[0, 1, 0, 1, 0], 
		[0, 1, 0, 1, 1], 
		[0, 1, 0, 0, 0], 
		[0, 0, 0, 1, 9]
	]


p maze_escape([	[0, 0, 0], 
				[0, 1, 9], 
				[0, 0, 0]])
# expected: [[0, 0], [1, 0], [2, 0], [2, 1]]
