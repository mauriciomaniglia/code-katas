import Cocoa

/*
 70. Climbing Stairs
 
 You are climbing a staircase. It takes n steps to reach the top.

 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

  

 Example 1:
 Input: n = 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 
 Example 2:
 Input: n = 3
 Output: 3
 
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step
 */




/*
 Solution
 
 Time: O(n)
 Space: O(1)
 */

class Solution {
    func climbStairs(_ n: Int) -> Int {
        var one = 1
        var two = 1
        
        for _ in 1..<n {
            let temp = one
            one = one + two
            two = temp
        }
        
        return one
    }
}

let solution = Solution()
solution.climbStairs(2)
solution.climbStairs(3)
solution.climbStairs(4)
solution.climbStairs(5)
solution.climbStairs(6)
