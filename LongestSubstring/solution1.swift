//Non optimal solution. Time: O(n ^ 2)

func solution(_ s: String) -> Int {
    var longSub = [Character]()
    var longCount = 0

    for (indexI, valueI) in s.enumerated() {

        if longSub.count > longCount { 
            longCount = longSub.count
        }      

        longSub.removeAll()  

        for (indexJ, valueJ) in s.enumerated() {
            if indexI > indexJ { continue }

            if longSub.contains(valueJ) {
                break
            } else {
                longSub.append(valueJ)
            }
        }
    }

    return longCount 
}

print("Example1: \(solution("abcabcbb"))")
print("Example2: \(solution("bbbbbb"))")
print("Example3: \(solution("pwwkew"))")
