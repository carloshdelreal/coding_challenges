# frozen_string_literal: true

def print_tree(array)
  array_tree = []
  array_tree += array
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

def max_child(tree)
  return 0 if tree.nil?
  return 1 if tree.left.nil? && tree.right.nil?

  [max_child(tree.left), max_child(tree.right)].max + 1
end

def balanced(tree)
  return true if tree.nil?
  return true if tree.left.nil? && tree.right.nil?
  return false if (max_child(tree.left) - max_child(tree.right)).abs > 1

  balanced(tree.left) && balanced(tree.right)
end

def balanced_tree?(array_tree)
  # write your code here
  # print_tree(array_tree)
  tree = array_to_tree(array_tree, 0)
  balanced(tree)
end

puts balanced_tree?([1, 2, 0, 3, 4, 0, 0])
# => false

puts balanced_tree?([1, 2, 3, 4, 5, 6, 7])
# => true
