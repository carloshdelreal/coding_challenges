# frozen_string_literal: true

def neighbors(map,node)
  "Node: #{node.to_s} Value: #{map[node[0]][node[1]]}"
  neighbor_nodes = []
  for y in (-1..1)
    for x in (-1..1)
      node_x = node[0]+x
      node_y = node[1]+y
      #puts "indexes: #{node_x}, #{node_y}"
      if (node_x < map.length && node_x >= 0) && (node_y < map[0].length && node_y >= 0)
        neighbor_nodes << [node_y,node_x]
      end
    end
  end
  neighbor_nodes
end
def peak?(map, node)
  greatest = nil
  neighbor_nodes = neighbors(map,node)
  puts "Neigbor Nodes: #{neighbor_nodes}"
  neighbor_nodes.each do |node|
    greatest ||= map[node[0]][node[1]]
    next if greatest > map[node[0]][node[1]]
    greatest = map[node[0]][node[1]]
  end
  greatest
end

def greatest_peaks(map)
  # write your code here
  p peak?(map,[2,2])
  p peak?(map,[0,0])
  p peak?(map,[2,0])
  p peak?(map,[0,2])
  p peak?(map,[1,1])
end

p greatest_peaks(
  [
    [9, 8, 5],
    [5, 6, 3],
    [8, 4, 1]
  ]
)
# => [3, 6]

# p greatest_peaks(
#   [
#     [8, 12],
#     [9, 3]
#   ]
# )
# => [1, 3]
