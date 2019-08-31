# frozen_string_literal: true

def print_tree_line(line_array)
  puts line_array.to_s.center(100, ' - ')
end

def print_tree(array)
  array_tree = []
  array_tree += array
  count = 1
  until array_tree.empty?
    print_tree_line(array_tree.shift(count))

    count *= 2
  end
end

puts print_tree([1, 2, 0, 3, 4, 0, 0])

puts print_tree([1, 2, 3, 4, 5, 6, 7])
