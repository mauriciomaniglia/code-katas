import Cocoa

/*
 167. Two Sum II - Input Array Is Sorted
 
 Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number. Let these two numbers be numbers[index1] and numbers[index2] where 1 <= index1 < index2 <= numbers.length.

 Return the indices of the two numbers, index1 and index2, added by one as an integer array [index1, index2] of length 2.

 The tests are generated such that there is exactly one solution. You may not use the same element twice.

 Your solution must use only constant extra space.
 
 
 Example 1:
 Input: numbers = [2,7,11,15], target = 9
 Output: [1,2]
 Explanation: The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2. We return [1, 2].
 
 Example 2:
 Input: numbers = [2,3,4], target = 6
 Output: [1,3]
 Explanation: The sum of 2 and 4 is 6. Therefore index1 = 1, index2 = 3. We return [1, 3].
 
 Example 3:
 Input: numbers = [-1,0], target = -1
 Output: [1,2]
 Explanation: The sum of -1 and 0 is -1. Therefore index1 = 1, index2 = 2. We return [1, 2].
 */


/*
 Solution1
 
 Time: O(n^2)
 Space: O(1)
 */

class Solution1 {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        for (i, iv) in numbers.enumerated() {
            for (j, jv) in numbers.enumerated() {
                if i == j { continue }
                if iv + jv == target { return [i+1, j+1] }
            }
        }
        
        return []
    }
}

let solution1 = Solution1()
solution1.twoSum([2,7,11,15], 9)
solution1.twoSum([2,3,4], 6)
solution1.twoSum([-1, 0], -1)


/*
 Solution2
 
 Time: O(n)
 Space: O(1)
 */

class Solution2 {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var leftPointer = 0
        var rightPointer = numbers.count-1
        
        while leftPointer < rightPointer {
            let sum = numbers[leftPointer] + numbers[rightPointer]
            
            if sum == target { return [leftPointer+1, rightPointer+1] }
            if sum > target { rightPointer -= 1 }
            if sum < target { leftPointer += 1 }
        }
        
        return []
    }
}

let solution2 = Solution2()
solution2.twoSum([2,7,11,15], 9)
solution2.twoSum([2,3,4], 6)
solution2.twoSum([-1, 0], -1)

