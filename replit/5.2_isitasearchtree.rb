# frozen_string_literal: true

def print_tree(array_tree)
  count = 1
  until array_tree.empty?
    puts array_tree.shift(count).to_s.center(150, ' - ')
    count *= 2
  end
end

class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end

def array_to_tree(array, i)
  return nil if i >= array.length || array[i] == 0

  node = Node.new(array[i])
  node.left = array_to_tree(array, 2 * i + 1)
  node.right = array_to_tree(array, 2 * i + 2)

  node
end

def max_value(tree)
  return 0 if tree.nil?
  return tree.data if tree.left.nil? && tree.right.nil?

  [max_value(tree.left), max_value(tree.right), tree.data].max
end

def min_value(tree)
  return 0 if tree.nil?
  return tree.data if tree.left.nil? && tree.right.nil?

  [min_value(tree.left), min_value(tree.right), tree.data].min
end

def check_search_tree(tree)
  return true if tree.nil?

  if tree.left.nil? && tree.right.nil?
    return true
  elsif tree.left.nil?
    return false unless tree.data < min_value(tree.right)

    return check_search_tree(tree.right)
  elsif tree.right.nil?
    return false unless tree.data > max_value(tree.left)

    return check_search_tree(tree.left)
  else
    return false unless tree.data < min_value(tree.right)
    return false unless tree.data > max_value(tree.left)

    return check_search_tree(tree.right) && check_search_tree(tree.left)
  end
end

def search_tree?(array_tree)
  tree = array_to_tree(array_tree, 0)
  check_search_tree(tree)
  # return "Min: #{min_value(tree)} Max: #{max_value(tree)} Search Tree? #{check_search_tree(tree)}"
end

puts search_tree?([10, 4, 12])
# => true

puts search_tree?([10, 5, 7])
# => false

puts search_tree?([20, 10, 27, 5, 14, 23, 30, 0, 12, 0, 0, 0, 0, 0, 0])
# => false

# print_tree([20, 10, 27, 5, 14, 23, 30, 0, 12, 0, 0, 0, 0, 0, 0])
