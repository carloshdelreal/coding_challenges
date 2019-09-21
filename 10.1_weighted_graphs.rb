# frozen_string_literal: true

def connected_nodes(matrix, node)
  connected = []
  conections = matrix[node]
  conections.each_with_index do |item, index|
    connected << index if item != 0
  end
  connected
end

def matrix_to_graph(matrix, start)
  q = Queue.new
  visited = []
  graph = {}
  q.push(start)
  until q.empty?
    p = q.pop
    (visited.include? p) ? next : visited.push(p)

    nodes = connected_nodes(matrix, p)
    graph[p] = nodes
    nodes.each { |x| q.push(x) }
  end
  graph
end

def graph_deph(graph, parents = [0], visited = [], levels = [], level = 0)
  return levels if parents.length <= 0

  # puts parents.join(' ')

  visited += parents

  level_nodes = []
  parents.each do |parent|
    level_nodes += graph[parent]
    levels[parent] ? next : levels[parent] = level
  end
  level += 1
  level_nodes = level_nodes.reject { |x| (visited.include? x) }

  graph_deph(graph, level_nodes, visited, levels, level)
end

def weighted_graphs(matrix)
  # write your code here
  graph = matrix_to_graph(matrix, 0)
  graph_deph(graph)
end

p weighted_graphs([[0, 0, 1, 3, 0, 0], [0, 0, 0, 5, 0, 0], [1, 0, 0, 2, 1, 4], [3, 5, 2, 0, 7, 0], [0, 0, 1, 7, 0, 2], [0, 0, 4, 0, 2, 0]])
# => [0, 2, 1, 1, 2, 2]
