import Cocoa

/*
 125. Valid Palindrome
 
 A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

 Given a string s, return true if it is a palindrome, or false otherwise.
 
 Example 1:
 Input: s = "A man, a plan, a canal: Panama"
 Output: true
 Explanation: "amanaplanacanalpanama" is a palindrome.
 
 Example 2:
 Input: s = "race a car"
 Output: false
 Explanation: "raceacar" is not a palindrome.
 
 Example 3:
 Input: s = " "
 Output: true
 Explanation: s is an empty string "" after removing non-alphanumeric characters.
 Since an empty string reads the same forward and backward, it is a palindrome.
 */


func isPalindrome(_ s: String) -> Bool {
    let filteredString = s.lowercased().filter { $0.isLetter }
    var left = 0
    var right = filteredString.count - 1
    let characters = Array(filteredString)

    while left < right {
        if characters[left] != characters[right] {
            return false
        }
        left += 1
        right -= 1
    }

    return true
}

let input1 = "A man, a plan, a canal: Panama"
let input2 = "race a car"
let input3 = " "

print(isPalindrome(input1))
print(isPalindrome(input2))
print(isPalindrome(input3))
