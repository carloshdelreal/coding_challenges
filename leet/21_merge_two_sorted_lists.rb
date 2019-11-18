# frozen_string_literal: true

# Input: 1->2->4, 1->3->4
# Output: 1->1->2->3->4->4

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

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  return nil if l1 == l2 && l1.nil?

  if l1.nil?
    head = l2
    current = l2
    l2 = l2.next
  elsif l2.nil?
    head = l1
    current = l1
    l1 = l1.next
  elsif l1.val < l2.val
    head = l1
    current = l1
    l1 = l1.next
  else
    head = l2
    current = l2
    l2 = l2.next
  end

  loop do
    break if l1 == l2 && l1.nil?

    if l1.nil?
      current.next = l2
      current = l2
      l2 = l2.next
    elsif l2.nil?
      current.next = l1
      current = l1
      l1 = l1.next
    elsif l1.val < l2.val
      current.next = l1
      current = l1
      l1 = l1.next
    else
      current.next = l2
      current = l2
      l2 = l2.next
    end
  end
  head
end

# p merge_two_lists(li1,li2)
p merge_two_lists(nil, li2)
