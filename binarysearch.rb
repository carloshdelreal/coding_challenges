# frozen_string_literal: true

class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end

def pre_order(node, first)
  return '' if node.nil?

  result = first ? result = node.data.to_s : " #{node.data}"
  result += pre_order(node.left, false)
  result += pre_order(node.right, false)
end

def binary_search_tree(array)
  # your code here
  def insert_node(tree, node)
    if tree.data > node.data
      if tree.left.nil?
        tree.left = node
      else
        insert_node(tree.left, node)
      end
    else
      if tree.right.nil?
        tree.right = node
      else
        insert_node(tree.right, node)
      end
    end
  end
  tree = Node.new(array.slice!(0))
  array.each do |x|
    node = Node.new(x)
    insert_node(tree, node)
  end
  pre_order(tree)
end

puts binary_search_tree([8, 3, 10, 1, 6, 14, 4, 7, 13])
#=> "8 3 1 6 4 7 10 14 13"
# tree = binary_search_tree([8, 3, 10, 1, 6, 14, 4, 7, 13])
# puts pre_order(tree)
