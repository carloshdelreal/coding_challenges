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
def merge_lists(lists)
    head = nil
    current = nil
    
    loop do
        smallest = nil
        smallest_index = nil
        lists.each_with_index do |l, index| 
            if l.nil?
                next
            elsif smallest.nil?
                smallest = l.val
                smallest_index = index
            elsif smallest > l.val
                smallest = l.val
                smallest_index = index
            end
        end
        
        return head if smallest_index.nil?
        l = lists[smallest_index]
        
        if l.nil?
            break
        elsif head.nil?
            head = l
            current = l
            lists[smallest_index] = l.next
        else
            current.next = l
            current = l
            lists[smallest_index] = l.next()
        end
        # puts "L: #{l.val}, current: #{current.val}, head: #{head.val}"
        # print_list(head)
        # sleep(0.2)
    end
    return head
end

def print_list(list)
    arr = []
    loop do
        arr.push(list.val)
        list = list.next()
        break if list.nil?
    end
    puts arr.join(" ")
end

# p merge_two_lists(li1,li2)
p merge_lists([])
p merge_lists([li1, li2, li3])