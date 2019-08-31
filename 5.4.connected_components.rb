# frozen_string_literal: true

def connected_nodes(graph, start)
  visited = []
  q = Queue.new
  q.push(start)
  until q.empty?
    poped = q.pop
    next if visited.any? poped

    nodes = graph[poped]
    visited.push(poped)
    nodes.each do |n|
      q.push(n)
    end
  end
  visited.sort
end

def connected_graph?(graph)
  keys = graph.keys
  conected = connected_nodes(graph, keys[0])
  return true if conected == keys

  false
end

# #test all nodes
# def connected_graph?(graph)
#   keys = graph.keys
#   graph.each do | key, value |
#     conected = connected_nodes(graph, key)
#     if conected != keys
#       return false
#     end
#   end
#   return true
# end

puts connected_graph?(
  0 => [2],
  1 => [4],
  2 => [0, 5, 3],
  3 => [5, 2],
  4 => [5, 1],
  5 => [4, 2, 3]
)
# => true

puts connected_graph?(
  0 => [1, 2],
  1 => [0, 2],
  2 => [0, 1, 3, 4, 5],
  3 => [2, 4],
  4 => [3, 2],
  5 => [2]
)
# => true

h = {
  0 => [2],
  1 => [4],
  2 => [0, 5, 3],
  3 => [5, 2],
  4 => [5, 1],
  5 => [4, 2, 3]
}

# h.each do | key, value | puts key end
