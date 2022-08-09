import Cocoa

/*
 15. 3Sum
 
 Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

 Notice that the solution set must not contain duplicate triplets.
 
 Example 1:
 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 Explanation:
 nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
 nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
 nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
 The distinct triplets are [-1,0,1] and [-1,-1,2].
 Notice that the order of the output and the order of the triplets does not matter.
 
 Example 2:
 Input: nums = [0,1,1]
 Output: []
 Explanation: The only possible triplet does not sum up to 0.
 
 Example 3:
 Input: nums = [0,0,0]
 Output: [[0,0,0]]
 Explanation: The only possible triplet sums up to 0.
 */


/*
 Solution1
 
 Time: O(n^3)
 Space: O(1)
 */
class Solution1 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted(by: <)
        var sum: [[Int]] = []
        
        for i in 0..<sortedNums.count {
            if i > 0 && (sortedNums[i] == sortedNums[i-1]) { continue }
            
            for j in i+1..<sortedNums.count {
                if j > i+1 && (sortedNums[j] == sortedNums[j-1]) { continue }
                
                for k in j+1..<sortedNums.count {
                    if k > j+1 && (sortedNums[k] == sortedNums[k-1]) { continue }
                    
                    if (sortedNums[i] + sortedNums[j] + sortedNums[k]) == 0 {
                        sum.append([sortedNums[i],sortedNums[j],sortedNums[k]])
                    }
                }
            }
        }
        
        return sum
    }
}

let solution1 = Solution1()
solution1.threeSum([-1,0,1,2,-1,-4])
solution1.threeSum([-3, 3, 4, -3, 2, 1])
solution1.threeSum([0,1,1])
solution1.threeSum([0,0,0])


/*
 Solution2
 
 Time: O(n^2)
 Space: O(1)
 */

class Solution2 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted(by: <)
        var sum: [[Int]] = []
        
        for i in 0..<sortedNums.count {
            if i > 0 && (sortedNums[i] == sortedNums[i-1]) { continue }
            
            var leftPointer = i+1
            var rightPointer = sortedNums.count-1
            
            while leftPointer < rightPointer {
                let triplet = sortedNums[i] + sortedNums[leftPointer] + sortedNums[rightPointer]
                
                if triplet > 0 {
                    rightPointer -= 1
                } else if triplet < 0 {
                    leftPointer += 1
                } else {
                    sum.append([sortedNums[i], sortedNums[leftPointer], sortedNums[rightPointer]])

                    leftPointer += 1
                }
            }
        }
        
        return sum
    }
}

let solution2 = Solution2()
solution2.threeSum([-1,0,1,2,-1,-4])
solution2.threeSum([-3, 3, 4, -3, 2, 1])
solution2.threeSum([0,1,1])
solution2.threeSum([0,0,0])
