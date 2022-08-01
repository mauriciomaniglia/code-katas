import Cocoa

/*
 238. Product of Array Except Self
 
 Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

 You must write an algorithm that runs in O(n) time and without using the division operation.
 
 Example 1:
 Input: nums = [1,2,3,4]
 Output: [24,12,8,6]
 
 Example 2:
 Input: nums = [-1,1,0,-3,3]
 Output: [0,0,9,0,0]
 */


/*
 Solution1
 
 Time: O(n^2)
 Space: O(n)
 */

class Solution1 {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var finalResult: [Int] = []
        
        for (i, _) in nums.enumerated() {
            var product = 1

            for (j, v) in nums.enumerated() {
                if i == j { continue }
                
                product *= v
            }
            
            finalResult.append(product)
        }
        
        return finalResult
    }
}

let solution1 = Solution1()
solution1.productExceptSelf([1,2,3,4])
solution1.productExceptSelf([-1,1,0,-3,3])




/*
 Solution
 
 Time:
 Space:
 */

class Solution2 {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var left = Array(repeating: 1, count: nums.count)
        var right = Array(repeating: 1, count: nums.count)
        var finalResult = Array(repeating: 1, count: nums.count)
        
        var i = 1
        while i < nums.count {
            left[i] = nums[i-1] * left[i-1]
            i += 1
        }
        
        var j = nums.count - 2
        while j >= 0 {
            right[j] = nums[j+1] * right[j+1]
            j -= 1
        }
        
        for (i, _) in nums.enumerated() {
            finalResult[i] = left[i] * right[i]
        }
        
        return finalResult
    }
}

let solution2 = Solution2()
solution2.productExceptSelf([1,2,3,4])
solution2.productExceptSelf([-1,1,0,-3,3])


