class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var finalResult: [Int] = []
        var product = 1
        
        for (index, _) in nums.enumerated() {
            for (innerIndex, innerValue) in nums.enumerated() {
                if index == innerIndex { continue }
                product = innerValue * product
            }
            finalResult.append(product)
            product = 1
        }
        
        return finalResult
    }
}

let solution = Solution()
print(solution.productExceptSelf([1, 2, 3, 4]))
print(solution.productExceptSelf([-1,1,0,-3,3]))
