// Optimal solution. Time: O(n) Space: O(n)

func solution(_ nums: [Int]) -> Bool {
    var dic = [Int:Int]()

    for i in nums {
        if dic[i] != nil {
            return true
        } else {
            dic[i] = 1
        }
    }

    return false
}

print("Example1: \(solution([1,2,3,1]))")
print("Example1: \(solution([1,2,3,4]))")
print("Example1: \(solution([1,1,1,3,3,4,3,2,4,2]))")
