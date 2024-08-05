import Cocoa

/*
 143. Reorder List
 
You are given the head of a singly linked-list. The list can be represented as:

L0 → L1 → … → Ln - 1 → Ln
Reorder the list to be on the following form:

L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …
You may not modify the values in the list's nodes. Only nodes themselves may be changed.

 

Example 1:

1 -> 2 -> 3 -> 4
 
1 -> 4 -> 2 -> 3
 
Input: head = [1,2,3,4]
Output: [1,4,2,3]
 
Example 2:

1 -> 2 -> 3 -> 4 -> 5
 
1 -> 5 -> 2 -> 4 -> 3

Input: head = [1,2,3,4,5]
Output: [1,5,2,4,3]
*/



//Definition for singly-linked list.

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reorderList(_ head: ListNode?) {
        // find middle
        var slow = head
        var fast = head
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        // divide list in half
        var second = slow?.next
        var prev: ListNode? = nil
        slow?.next = nil
        
        // reverse second half
        while second != nil {
            let temp = second?.next
            second?.next = prev
            prev = second
            second = temp
        }        
        
        // merge two halfs
        var first = head
        second = prev
        while second != nil {
            let temp1 = first?.next
            let temp2 = second?.next
            first?.next = second
            second?.next = temp1
            first = temp1
            second = temp2
        }
    }
}

let listNode6 = ListNode(6)
let listNode5 = ListNode(5, listNode6)
let listNode4 = ListNode(4, listNode5)
let listNode3 = ListNode(3, listNode4)
let listNode2 = ListNode(2, listNode3)
let listNode1 = ListNode(1, listNode2)

var solution = Solution()
solution.reorderList(listNode1)

listNode1

