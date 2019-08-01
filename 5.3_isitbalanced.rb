class Node
	attr_reader :data
	attr_accessor :left, :right

	def initialize(data)
		@data = data
	end
end

def binary_search_tree(array)
  # your code here
  def insert_node(tree, node)
    if tree.data > node.data
      if tree.left == nil
        tree.left = node
      else
        insert_node(tree.left, node)
      end
    else
      if tree.right == nil
        tree.right = node
      else
        insert_node(tree.right, node)
      end
    end
  end
  tree = Node.new(array.slice!(0))
  array.each do | x |
    node = Node.new(x)
    insert_node(tree,node)
  end
  return tree
end

def balanced_tree?(array_tree)
	# write your code here
	tree = binary_search_tree(array_tree)
end

puts balanced_tree?([1, 2, 0, 3, 4, 0, 0])
# => false

puts balanced_tree?([1, 2, 3, 4, 5, 6, 7])
# => true