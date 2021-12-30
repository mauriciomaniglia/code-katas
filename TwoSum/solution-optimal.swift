// Solution using an optimal approach. Run time: O(N) Space: O(N)

func solution(nums: [Int], target: Int) -> [Int] {
    var dic = [Int:Int]()

    for (index, value) in nums.enumerated() {
        let targetValue = target - value

        if let foundIndex = dic[targetValue] {
            return [foundIndex, index]
        } else {
            dic[value] = index
        }
    }

    return []
}

 print(solution(nums: [2,7,11,15], target: 9))
 print(solution(nums: [3,2,4], target: 6))
 print(solution(nums: [3,3], target: 6))
