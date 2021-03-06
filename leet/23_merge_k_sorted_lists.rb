# frozen_string_literal: true

# [
#     1->4->5,
#     1->3->4,
#     2->6
#   ]

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end
li1 = ListNode.new(1)
n = ListNode.new(2)
li1.next = n
n.next = ListNode.new(4)

li2 = ListNode.new(1)
n = ListNode.new(3)
li2.next = n
n.next = ListNode.new(4)

li3 = ListNode.new(2)
n = ListNode.new(4)
li3.next = n
n.next = ListNode.new(5)

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_k_lists(lists)
  smallest = {}
  lists.each do |l|
    next if l.nil?

    loop do
      if smallest[l.val].nil?
        smallest[l.val] = 1
        l = l.next
      end
      smallest[l.val] += 1
      l = l.next
      break if l.nil?
    end
  end
  solution = []
  smallest.keys.sort.each do |x|
    smallest[x].times { solution.push x }
  end
  solution
end

def print_list(list)
  arr = []
  loop do
    arr.push(list.val)
    list = list.next
    break if list.nil?
  end
  puts arr.join(' ')
end

# p merge_two_lists(li1,li2)
p merge_k_lists([])
p merge_k_lists([li1, li2, li3])
