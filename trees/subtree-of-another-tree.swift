import Cocoa

/*
 572. Subtree of Another Tree
 
 Given the roots of two binary trees root and subRoot, return true if there is a subtree of root with the same structure and node values of subRoot and false otherwise.

 A subtree of a binary tree tree is a tree that consists of a node in tree and all of this node's descendants. The tree tree could also be considered as a subtree of itself.

  
 Example 1:
        3
       / \
      4   5     4
     / \       / \
    1   2     1   2

 Input: root = [3,4,5,1,2], subRoot = [4,1,2]
 Output: true
 
 Example 2:
         3
        / \
       4   5     4
      / \       / \
     1   2     1   2
        /
       0
 
 Input: root = [3,4,5,1,2,null,null,null,null,0], subRoot = [4,1,2]
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
 
 Time: O(s*t)
 Space: O(n)
 */

class Solution {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if subRoot == nil { return true }
        if root == nil { return false }
        
        if isSameTree(root, subRoot) {
            return true
        }
        
        return isSameTree(root?.left, subRoot) || isSameTree(root?.right, subRoot)
    }
    
    private func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }

        guard let tree1 = p, let tree2 = q, tree1.val == tree2.val else { return false }
        
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
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
solution.isSubtree(root, node6)

