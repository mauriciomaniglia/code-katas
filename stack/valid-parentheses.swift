import Cocoa

/*
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
  

 Example 1:
 Input: s = "()"
 Output: true
 
 Example 2:
 Input: s = "()[]{}"
 Output: true
 
 Example 3:
 Input: s = "(]"
 Output: false
 */





/*
 Solution
 
 Time: O(n)
 Space: O(n)
 */

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        let parentheses: [Character:Character] = ["]": "[", "}": "{", ")": "("]
        
        for i in s {
            if parentheses.contains(where: { (k, v) in k == i }) {
                if stack.last == parentheses[i] {
                    stack.removeLast()
                } else {
                    return false
                }
            } else {
                stack.append(i)
            }
        }
                
        return stack.isEmpty
    }
}

let solution = Solution()
solution.isValid("()")
solution.isValid("()[]{}")
solution.isValid("(}")
solution.isValid("(())")
solution.isValid("(({[]}))")
solution.isValid("(({[}}))")

