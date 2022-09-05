import Cocoa

/*
 235. Lowest Common Ancestor of a Binary Search Tree
 
 Given a binary search tree (BST), find the lowest common ancestor (LCA) node of two given nodes in the BST.

 According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

  

 Example 1:
              6
           /    \
          2      8
         / \    / \
        0   4  7   9
           / \
          3   5
 
 Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
 Output: 6
 Explanation: The LCA of nodes 2 and 8 is 6.
 
 Example 2:
          6
        /    \
       2      8
      / \    / \
     0   4  7   9
        / \
       3   5

 Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
 Output: 2
 Explanation: The LCA of nodes 2 and 4 is 2, since a node can be a descendant of itself according to the LCA definition.
 
 Example 3:

 Input: root = [2,1], p = 2, q = 1
 Output: 2
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
 
 Time: O(log n)
 Space: O(1)
*/

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var current = root
        
        while current != nil {
            if p!.val > current!.val && q!.val > current!.val {
                current = current?.right
            }
            else if p!.val < current!.val && q!.val < current!.val {
                current = current?.left
            }
            else {
                return current
            }
        }
        
        return nil
    }
}

let node1 = TreeNode(3)
let node2 = TreeNode(5)
let node3 = TreeNode(4, node1, node2)

let node4 = TreeNode(0)
let node5 = TreeNode(2, node4, node3)

let node6 = TreeNode(7)
let node7 = TreeNode(9)
let node8 = TreeNode(8, node6, node7)

let root = TreeNode(6, node5, node8)

let solution = Solution()
solution.lowestCommonAncestor(root, node5, node3)
