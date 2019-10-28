# frozen_string_literal: true

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  result = head
  return_list = head

  count = 0
  until head.nil?
    count += 1
    head = head.next
  end

  remove_index = count - n
  count = 0
  puts "remove index: #{remove_index}"
  while count < remove_index
    count += 1
    result = result.next
  end
  puts "result value: #{result.val}"
  actual = result
  result = result.next
  actual.next = result.next

  return_list
end

# list = ListNode.new(1)
# return_list = list
# list.next = ListNode.new(2)
# list = list.next
# list.next = ListNode.new(3)
# list = list.next
# list.next = ListNode.new(4)
# list = list.next
# list.next = ListNode.new(5)
# list = list.next

# p remove_nth_from_end(return_list, 1)

list = ListNode.new(1)
return_list = list
list.next = ListNode.new(2)

p remove_nth_from_end(return_list, 2)
