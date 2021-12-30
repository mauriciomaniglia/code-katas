//Brute force approach. N ** 2

func solution(nums: [Int], target: Int) -> [Int] {
    for (nIndex, nValue) in nums.enumerated() {
        for (jIndex, jValue) in nums.enumerated() {
            if nIndex == jIndex { continue }

            if (nValue + jValue) == target { return [nIndex, jIndex] }
        }
    }

    return []
}

print(solution(nums: [2,7,11,15], target: 9))
print(solution(nums: [3,2,4], target: 6))
print(solution(nums: [3,3], target: 6))
