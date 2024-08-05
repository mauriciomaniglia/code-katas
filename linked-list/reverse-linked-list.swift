import Cocoa

/*
 206. Reverse Linked List
 
 Given the head of a singly linked list, reverse the list, and return the reversed list.
 
 Example1:
 Input: head = [1,2,3,4,5]
 Output: [5,4,3,2,1]
 
 Example2:
 Input: head = [1,2]
 Output: [2,1]
 
 Example3:
 Input: head = []
 Output: []
 
 */


/*
 Solution
 
 Time:O(n)
 Space:O(1)
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }

}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        var current = head
     
        while current != nil {
            if let next = current?.next {
                current?.next = prev
                prev = current
                current = next
            } else {
                current?.next = prev
                break
            }
        }
        
        return current
    }
}

let node5 = ListNode(5)
let node4 = ListNode(4, node5)
let node3 = ListNode(3, node4)
let node2 = ListNode(2, node3)
let node1 = ListNode(1, node2)

let solution = Solution()
solution.reverseList(node1)

