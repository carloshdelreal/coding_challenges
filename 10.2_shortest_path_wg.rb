
def connected_nodes(matrix, node)
  connected = []
  conections = matrix[node[0]]
  conections.each_with_index do |item, index|
    if item != 0
      connected << [index, item]
    end
  end
  connected
end

def matrix_to_graph(matrix, start)
  q = Queue.new 
  visited = []
  graph = { }
  q.push(start)
  while q.length > 0
    p = q.pop
    (visited.include? p) ? next : visited.push(p)
    nodes = connected_nodes(matrix, p)
    graph[p[0]] = nodes
    nodes.each{|x| q.push(x)}
  end
  graph
end

def shortest_path(graph, parents = [[0,0]], visited = [], visited_hash = {})

  return graph, visited, visited_hash if parents.length <=0
  #puts parents.join(' ')
  parents.each do |x| 
    if visited_hash[x[0]] == nil
      visited_hash[x[0]] = x[1]
      visited << x
    elsif visited_hash[x[0]] > x[1]
      visited_hash[x[0]] = x[1]
      visited << x
    end
  end

  level_nodes = []
  parents.each do |parent|
    parents_level_nodes = graph[parent[0]]
    puts "Parent: #{parent.to_s} Level Nodes: #{parents_level_nodes.to_s}"
    #parents_level_nodes.each{|node| node[1] = node[1].to_i + parent[1].to_i}
    #parents_level_nodes.each{|x| level_nodes.push([x[0], x[1]])}
    parents_level_nodes.each do |node| 
      level_nodes.push([node[0], node[1] + parent[1]])
    end
  end
  
  #puts "Visited: #{visited}"
  #puts "Parents: #{parents.to_s}"
  #puts "Level Nodes: #{level_nodes}"
  
  selected_nodes = []
  level_nodes.each do |level_node|
    if visited_hash[level_node[0]] == nil
      selected_nodes << level_node
    elsif visited_hash[level_node[0]] > level_node[1]
      selected_nodes << level_node
    end
  end
  selected_nodes.sort_by!{ |el| [el[0],el[1]] }
  
  puts ""
  shortest_path(graph, selected_nodes, visited, visited_hash)
  
end

def shortest_path_wg(matrix)
  # write your code here

  graph = matrix_to_graph(matrix,[0,0])
  puts graph
  shortest_path(graph)[2].sort.collect{|x| x[1]}
end

#p shortest_path_wg([[0, 0, 1, 3, 0, 0], [0, 0, 0, 5, 0, 0], [1, 0, 0, 2, 1, 4], [3, 5, 2, 0, 7, 0], [0, 0, 1, 7, 0, 2], [0, 0, 4, 0, 2, 0]])
# => [0, 8, 1, 3, 2, 4]

# p shortest_path_wg([[0, 3, 6, 0, 0, 9, 4], [3, 0, 4, 1, 0, 0, 0], [6, 4, 0, 3, 5, 4, 1], [0, 1, 3, 0, 2, 0, 0], [0, 0, 5, 2, 0, 3, 0], [9, 0, 4, 0, 3, 0, 3], [4, 0, 1, 0, 0, 3, 0]])
# =>[0, 3, 5, 4, 6, 7, 4]

p shortest_path_wg([[0, 3, 6, 0, 0, 10], [3, 0, 4, 1, 0, 0], [6, 4, 0, 3, 5, 4], [0, 1, 3, 0, 2, 0], [0, 0, 5, 2, 0, 3], [10, 0, 4, 0, 3, 0]])
# =>[0, 3, 6, 4, 6, 9]