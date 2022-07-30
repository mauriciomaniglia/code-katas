import Cocoa

/*
 217. Contains Duplicate
 
 Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
 
 Example 1:
 Input: nums = [1,2,3,1]
 Output: true
 
 Example 2:
 Input: nums = [1,2,3,4]
 Output: false
 
 Example 3:
 Input: nums = [1,1,1,3,3,4,3,2,4,2]
 Output: true
 
 */




/*
 Solution1
 
 Time: O(n^2)
 Space: O(1)
 
 */

class Solution1 {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        for (i, outerValue) in nums.enumerated() {
            for (j, innerValue) in nums.enumerated() {
                if i == j { continue }
                if outerValue == innerValue { return true }
            }
        }

        return false
    }
}

let solution1 = Solution1()
solution1.containsDuplicate([1,2,3,1])
solution1.containsDuplicate([1,2,3,4])
solution1.containsDuplicate([1,1,1,3,3,4,3,2,4,2])


/*
 Solution2
 
 Time: O(n)
 Space: O(n)
 
 */

class Solution2 {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var previousValues: [Int: Bool] = [:]
        
        for i in nums {
            if previousValues[i] == nil {
                previousValues[i] = true
            } else {
                return true
            }
        }
        
        return false
    }
}

let solution2 = Solution2()
solution2.containsDuplicate([1,2,3,1])
solution2.containsDuplicate([1,2,3,4])
solution2.containsDuplicate([1,1,1,3,3,4,3,2,4,2])
