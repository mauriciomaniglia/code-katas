//

func solution(_ s: String) -> Bool {
    var formattedString = [Character]()
    var invertedString = ""

    for c in s {
        if c.isLetter {
            formattedString.append(c)
        } 
    }

    for (index, _) in formattedString.enumerated() {
        invertedString.append(formattedString[(formattedString.count - 1) - index])
    }

    return String(formattedString).lowercased() == invertedString.lowercased()
}


print(solution("A man, a plan, a canal: Panama"))
print(solution("race a car"))
print(solution(" "))
