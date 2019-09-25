# frozen_string_literal: true

def bfs(graph, start = 0)
  # write your code here
  q = Queue.new
  visited = []
  q.push(start)
  until q.empty?
    p = q.pop
    (visited.include? p) ? next : visited.push(p)

    nodes = graph[p]
    nodes.each { |x| q.push(x) }
  end
  visited
end

def recursive_bfs(graph, parents = [0], visited = [])
  return visited if parents.length <= 0

  visited += parents
  level_nodes = []
  parents.each do |parent|
    level_nodes += graph[parent]
  end
  level_nodes = level_nodes.reject { |x| (visited.include? x) }
  recursive_bfs(graph, level_nodes, visited)
end

p bfs(
  0 => [2],
  1 => [4],
  2 => [5, 0, 3],
  3 => [2],
  4 => [1, 5],
  5 => [4, 2]
)
#=> [0, 2, 5, 3, 4, 1]

p recursive_bfs(
  0 => [2],
  1 => [4],
  2 => [5, 0, 3],
  3 => [2],
  4 => [1, 5],
  5 => [4, 2]
)
