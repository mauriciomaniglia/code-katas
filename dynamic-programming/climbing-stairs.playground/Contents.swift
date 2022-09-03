import Cocoa

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
