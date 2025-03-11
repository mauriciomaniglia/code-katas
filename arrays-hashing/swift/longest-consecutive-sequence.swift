/***

Longest Consecutive Sequence

Given an array of integers nums, return the length of the longest consecutive sequence of elements.

A consecutive sequence is a sequence of elements in which each element is exactly 1 greater than the previous element.

You must write an algorithm that runs in O(n) time.

Example 1:

Input: nums = [2,20,4,10,3,4,5]
Output: 4

Explanation: The longest consecutive sequence is [2, 3, 4, 5].

Example 2:

Input: nums = [0,3,2,5,4,6,1,1]
Output: 7

***/

func longestConsecutive(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }

    let numsSet = Set(nums)  // Using a Set for O(1) lookups
    var longestStreak = 0

    for num in nums {
        
        // Only check if `num` is the start of a sequence
        if !numsSet.contains(num-1) {
            var currentNum = num
            var currentStreak = 1

            while numsSet.contains(currentNum + 1) {
                currentNum += 1
                currentStreak += 1
            }

            longestStreak = max(longestStreak, currentStreak)
        }
    }

    return longestStreak
}


let nums = [0,3,2,5,4,6,1,1]
print(longestConsecutive(nums))
