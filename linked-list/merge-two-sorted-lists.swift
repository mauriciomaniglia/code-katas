import Cocoa

/*
 21. Merge Two Sorted Lists
 
 You are given the heads of two sorted linked lists list1 and list2.

 Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.

 Return the head of the merged linked list.

  

 Example 1:
 Input: list1 = [1,2,4], list2 = [1,3,4]
 Output: [1,1,2,3,4,4]
 
 Example 2:
 Input: list1 = [], list2 = []
 Output: []
 
 Example 3:
 Input: list1 = [], list2 = [0]
 Output: [0]
 */


//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func printList(_ node: ListNode?) {
    var node: ListNode? = node
    
    while node != nil {
        print(node!.val)
        node = node?.next
    }
}

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var dummy: ListNode? = ListNode(-1)
        let head = dummy
        var l1 = list1
        var l2 = list2
        
        while l1 != nil && l2 != nil {
            
            if l1!.val < l2!.val {
                dummy?.next = l1
                l1 = l1?.next
            } else {
                dummy?.next = l2
                l2 = l2?.next
            }
            
            dummy = dummy?.next
        }
        
        if l1 != nil {
            dummy?.next = l1
        } else {
            dummy?.next = l2
        }
        
        return head?.next
    }
}

let a3 = ListNode(4)
let a2 = ListNode(3, a3)
let a1 = ListNode(1, a2)

let b3 = ListNode(3)
let b2 = ListNode(2, b3)
let b1 = ListNode(1, b2)

let solution = Solution()
let merge = solution.mergeTwoLists(a1, b1)

printList(merge)

