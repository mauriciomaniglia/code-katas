import Cocoa

/*
 1. Two Sum
 
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 You can return the answer in any order.
 
 Example 1:
 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 
 Example 2:
 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 
 Example 3:
 Input: nums = [3,3], target = 6
 Output: [0,1]
 */



/*
 Solution1
 
 Time: O(n ^2)
 Space: O(1)
 
 */

class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for (i, outerValue) in nums.enumerated() {
            for (j, innerValue) in nums.enumerated() {
                if i == j { continue }
                
                if outerValue + innerValue == target { return [i, j] }
            }
        }
        return []
    }
}

let solution1 = Solution1()
solution1.twoSum([2,7,11,15], 9)
solution1.twoSum([3,2,4], 6)
solution1.twoSum([3,3], 6)
solution1.twoSum([3,3], 8)




/*
 Solution2
 
 Time: O(n)
 Space: O(n)
 
 */

class Solution2 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var previousIndex: [Int: Int] = [:]
        
        for (i, v) in nums.enumerated() {
            let remaining = target - v
            
            if let p = previousIndex[remaining] {
                return [p, i]
            } else {
                previousIndex[v] = i
            }
        }

        return []
    }
}

let solution2 = Solution2()
solution2.twoSum([2,7,11,15], 9)
solution2.twoSum([3,2,4], 6)
solution2.twoSum([3,3], 6)
solution2.twoSum([3,3], 8)

