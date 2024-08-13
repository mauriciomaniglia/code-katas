import Cocoa

/*
 230. Kth Smallest Element in a BST
 
 Given the root of a binary search tree, and an integer k, return the kth smallest value (1-indexed) of all the values of the nodes in the tree.

  

 Example 1:
         3
        / \
       1   4
        \
         2
 Input: root = [3,1,4,null,2], k = 1
 Output: 1
 
 Example 2:
         5
        / \
       3   6
      / \
     2   4
    /
   1
 Input: root = [5,3,6,2,4,null,null,1], k = 3
 Output: 3
 */



//Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


/*
 Solution
 
 Time:
 Space:
 */

class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var n = 0
        var stack = [TreeNode]()
        var current: TreeNode? = root
        
        while current != nil || !stack.isEmpty {
            while current != nil {
                if let current = current { stack.append(current) }
                current = current?.left
            }
            
            current = stack.removeLast()
            n += 1
            
            if n == k {
                return current!.val
            }
            
            current = current?.right
        }
        
        return 0
    }
}

let node1 = TreeNode(1)
let node2 = TreeNode(3)
let node3 = TreeNode(2, node1, node2)

let node4 = TreeNode(6)
let node5 = TreeNode(9)
let node6 = TreeNode(7, node4, node5)

let root = TreeNode(4, node3, node6)

let solution = Solution()
solution.kthSmallest(root, 3)

