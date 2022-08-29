import Cocoa

/*
 Given the root of a binary tree, invert the tree, and return its root.

 Example 1:
 Input: root = [4,2,7,1,3,6,9]
 Output: [4,7,2,9,6,3,1]
 
 Example 2:
 Input: root = [2,1,3]
 Output: [2,3,1]
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


// Time: O(n)
// Space: O(1)

class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard root != nil else { return nil }
        
        let temp = root?.left
        root?.left = root?.right
        root?.right = temp
        
        invertTree(root?.left)
        invertTree(root?.right)
        
        return root
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
solution.invertTree(root)
