# frozen_string_literal: true

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}

def add_numbers(list1, list2)
  result = nil
  curr = nil
  reminder = 0
  while list1 || list2
    value = list1.val if list1 && list2.nil?
    value = list2.val if list2 && list1.nil?
    value = list1.val + list2.val if list1 && list2
    value += reminder
    reminder = 0
    if value >= 10
      reminder = value / 10
      value -= 10
    end
    value_node = ListNode.new(value)
    if result
      curr.next = value_node
    else
      result = value_node
    end
    curr = value_node
    list1 = list1.next if list1
    list2 = list2.next if list2
  end
  if list1.nil? && list2.nil? && reminder.positive?
    value_node = ListNode.new(reminder)
    curr.next = value_node
  end
  result
end
