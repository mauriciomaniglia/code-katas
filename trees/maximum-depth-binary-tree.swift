import Cocoa

/*
 104. Maximum Depth of Binary Tree
 
 Given the root of a binary tree, return its maximum depth.

 A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

 Example 1:
 Input: root = [3,9,20,null,null,15,7]
 Output: 3
 
 Example 2:
 Input: root = [1,null,2]
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
 Solution1
 
 DFS - Recursive
 
 Time: O(n)
 Space: O(n)
 
 */

class Solution1 {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        return 1 + max(maxDepth(root.left), maxDepth(root.right))
    }
}


/*
 Solution2
 
 BFS - Interactive
 
 Time: O(n)
 Space: O(n)
 
 */

class Solution2 {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var level = 0
        var queue: [TreeNode] = [root]
        
        while !queue.isEmpty {
            
            for _ in 1...queue.count {
                let node = queue.removeFirst()
                
                if let leftChild = node.left {
                    queue.append(leftChild)
                }
                
                if let rightChild = node.right {
                    queue.append(rightChild)
                }
            }
            
            level += 1
        }
        
        return level
    }
}

let node1 = TreeNode(1)
let node2 = TreeNode(3)
let node3 = TreeNode(2, node1, node2)

let node4 = TreeNode(6)
let node5 = TreeNode(9)
let node6 = TreeNode(7, node4, node5)

let root = TreeNode(4, node3, node6)

let solution2 = Solution2()
solution2.maxDepth(root)

