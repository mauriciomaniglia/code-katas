// Optimal solution. Time: O(n). Space: O(n)

func solution(_ s: String) -> Int {
    var longSub = [Character]()
    var longCount = 0
    
    for c in s {
        if longSub.contains(c) {            
            if longSub.count > longCount {
                longCount = longSub.count
            }

            longSub.removeAll()
            longSub.append(c)

        } else {
            longSub.append(c)
        }
    }

    return longCount
}

print("Example1: \(solution("abcabcbb"))")
print("Example2: \(solution("bbbbbb"))")
print("Example3: \(solution("pwwkew"))")
