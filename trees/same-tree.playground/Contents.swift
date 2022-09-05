import Cocoa

/*
 100. Same Tree
 
 Given the roots of two binary trees p and q, write a function to check if they are the same or not.

 Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.
 
 Example 1:
        1      1
       / \    / \
      2   3  2   3
 
 Input: p = [1,2,3], q = [1,2,3]
 Output: true
 
 Example 2:
       1      1
      /        \
     2          2
 
 Input: p = [1,2], q = [1,null,2]
 Output: false
 
 Example 3:
      1       1
     / \     / \
    2   1   1   2

 Input: p = [1,2,1], q = [1,1,2]
 Output: false
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
 
 Time: O(n)
 Space: O(n)
 
 */

class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if (p == nil && q == nil) { return true }
        
        guard let tree1 = p, let tree2 = q, tree1.val == tree2.val else { return false }
        
        return isSameTree(tree1.left, tree2.left) && isSameTree(tree1.right, tree2.right)
    }
}


let node1 = TreeNode(1)
let node2 = TreeNode(3)
let node3 = TreeNode(2, node1, node2)

let node4 = TreeNode(6)
let node5 = TreeNode(9)
let node6 = TreeNode(7, node4, node5)

let root1 = TreeNode(4, node3, node6)
let root2 = TreeNode(4, node3, node6)

let solution = Solution()
solution.isSameTree(root1, root2)
