# frozen_string_literal: true

def control_area(map, control_node)
  control_nodes = []
  [[-1, 0], [0, -1], [0, 1], [1, 0]].each do |node|
    node_x = control_node[0] + node[0]
    node_y = control_node[1] + node[1]
    control_nodes << [node_x, node_y] if
        (node_x < map.length && node_x >= 0) &&
        (node_y < map[0].length && node_y >= 0)
  end
  control_nodes
end

def value(map, node)
  map[node[0]][node[1]]
end

def peak?(map, node)
  greatest = nil
  control_area(map, node).each do |neighbor_node|
    neighbor_value = value(map, neighbor_node)
    greatest ||= neighbor_value
    next if greatest > neighbor_value

    greatest = neighbor_value
  end
  value = value(map, node)
  # puts "Value: #{value}, Neigbor Nodes: #{neighbors(map, node).collect{|x| value(map,x)}}"
  greatest < value
end

def peaks(map)
  peak_nodes = []
  (0..map.length - 1).each do |y|
    (0..map[0].length - 1).each do |x|
      peak_nodes << [x, y] if peak?(map, [x, y])
    end
  end
  peak_nodes
end

def area_nodes(map, peak)
  neighbors(map, peak).select { |x| value(map, x) < value(map, peak) }
end

def recursive_bfs(map, parents = [[0, 0]], visited = [])
  return visited if parents.length <= 0

  level_nodes = []
  parents.each do |parent|
    visited << parent unless visited.include? parent
    control_area(map, parent).each do |area_node|
      dominant = control_area(map, area_node).collect { |x| value(map, x) }
      next if value(map, parent) != dominant.max
      next if value(map, parent) < value(map, area_node)

      # puts "Parent: #{value(map, parent)}, Area Node: #{value(map, area_node)} control: #{dominant.to_s}"
      level_nodes.push(area_node) if value(map, parent) == dominant.max
    end
  end
  level_nodes = level_nodes.reject { |x| (visited.include? x) }
  recursive_bfs(map, level_nodes, visited)
end

def greatest_peaks(map)
  peak_nodes = peaks(map).sort
  # puts "Peaks: #{peak_nodes.collect{ |x| value(map, x)}}"
  areas = peak_nodes.collect { |x| recursive_bfs(map, [x]).count }

  areas.minmax
end

p greatest_peaks(
  [
    [9, 8, 5],
    [5, 6, 3],
    [8, 4, 1]
  ]
)
# => [3, 6]

p greatest_peaks(
  [
    [8, 12],
    [9, 3]
  ]
)
# => [1, 3]

p greatest_peaks([[2, 6, 9, 11], [7, 8, 9, 8], [6, 7, 12, 9], [10, 7, 6, 4]])
# =>[3, 9]

p greatest_peaks([[4, 3, 2, 1], [2, 1, 0, 5], [0, 7, 4, 6], [10, 8, 4, 7]])
# =>[4, 7]

p greatest_peaks([[3, 6, 9, 11, 3], [5, 8, 12, 4, 6], [7, 10, 13, 2, 14], [0, 1, 5, 9, 3], [2, 8, 6, 4, 0]])
# =>[2, 13]
