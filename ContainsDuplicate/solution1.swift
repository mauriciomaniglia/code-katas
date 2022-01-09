//Non optimal solution. Big O(n ^ 2)

func solution(_ nums: [Int]) -> Bool {
    for (indexI, valueI) in nums.enumerated() {
        for (indexJ, valueJ) in nums.enumerated() {
            if indexI == indexJ { continue }

            if valueI == valueJ { return true }
        }
    }
    
    return false
}


print("Example1: \(solution([1,2,3,1]))")
print("Example1: \(solution([1,2,3,4]))")
print("Example1: \(solution([1,1,1,3,3,4,3,2,4,2]))")
