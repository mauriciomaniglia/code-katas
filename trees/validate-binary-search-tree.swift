import Cocoa

/*
 
 98. Validate Binary Search Tree
 
 Given the root of a binary tree, determine if it is a valid binary search tree (BST).

 A valid BST is defined as follows:

 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
  

 Example 1:
          2
         / \
        1   3
 Input: root = [2,1,3]
 Output: true
 
 Example 2:
          5
         / \
        1   4
           / \
          3   6
 Input: root = [5,1,4,null,null,3,6]
 Output: false
 Explanation: The root node's value is 5 but its right child's value is 4.
 
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
 Space:
 */

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return valid(root, -10000, 10000)
    }
    
    func valid(_ node: TreeNode?, _ leftValue: Int, _ rightValue: Int) -> Bool {
        guard let node = node else { return true }
        
        if node.val < rightValue && node.val > leftValue {
            return valid(node.left, leftValue, node.val) && valid(node.right, node.val, rightValue)
        } else {
            return false
        }
    }
}

let node1 = TreeNode(1)
let node2 = TreeNode(3)
let node3 = TreeNode(2, node1, node2)

let node4 = TreeNode(6)
let node5 = TreeNode(9)
let node6 = TreeNode(7, node4, node5)

let root = TreeNode(4, node3, node6)


/*
 
          4
        /   \
       2     7
      / \   / \
     1   3 6   9
 
 */

let solution = Solution()
solution.isValidBST(root)

