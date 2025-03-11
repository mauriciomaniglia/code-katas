import Cocoa

/*
 347. Top K Frequent Elements
 
 Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.
 
 Example 1:
 Input: nums = [1,1,1,2,2,3], k = 2
 Output: [1,2]
 
 Example 2:
 Input: nums = [1], k = 1
 Output: [1]
 */




/*
 Solution1
 
 Time: O(n)
 Space: O(n)
 */


class Solution1 {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count > 1 else { return [nums[0]] }

        var frequencyCounter: [Int:Int] = [:]
        let sortedNums = nums.sorted(by: <)
        
        var index = 0
        var currentFrequency = 1

        while index < (sortedNums.count - 1) {
            if sortedNums[index] == sortedNums[index+1] {
                currentFrequency += 1
            } else {
                frequencyCounter[currentFrequency] = sortedNums[index]
                currentFrequency = 1
            }
            
            index += 1
        }
        
        var topKList: [Int] = []
        let sortedKeyList = frequencyCounter.keys.sorted(by: >)
        
        for i in 0..<k {
            let key = sortedKeyList[i]
            if let value = frequencyCounter[key] {
                topKList.append(value)
            }
        }
        
        return topKList
    }
}

let solution1 = Solution1()
solution1.topKFrequent([1,1,1,2,2,3], 2)
solution1.topKFrequent([1,1,1,2,2,3,3,3,3,4,4], 2)
solution1.topKFrequent([1,1,1,2,2,3,3,3,3,4,4], 3)
solution1.topKFrequent([1], 1)

