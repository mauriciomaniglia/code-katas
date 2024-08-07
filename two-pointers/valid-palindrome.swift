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



/*
 Solution1
 
 Time: O(n)
 Space: O(n)
 */

class Solution1 {
    func isPalindrome(_ s: String) -> Bool {
        var formattedString: [String] = []
        
        for l in s {
            if l.isLetter {
                formattedString.append(l.lowercased())
            }
        }
        
        if formattedString.count == 0 { return true }

        var endPointer = formattedString.count - 1
        var startPointer = 0
        
        while(startPointer != endPointer) {

            if formattedString[startPointer] != formattedString[endPointer] {
                return false
            }
            
            startPointer += 1
            endPointer -= 1
        }
        
        return true
    }
}

let solution1 = Solution1()
solution1.isPalindrome("A man, a plan, a canal: Panama")
solution1.isPalindrome("race a car")
solution1.isPalindrome(" ")



/*
 Solution2
 
 Time: O(n)
 Space: O(1)
 */

class Solution2 {
    func isPalindrome(_ s: String) -> Bool {
        var startPointer = 0
        var endPointer = s.count - 1
        
        while startPointer != endPointer {
            let startIndex = String.Index(utf16Offset: startPointer, in:s)
            let endIndex =  String.Index(utf16Offset: endPointer, in:s)
            
            if s[startIndex].isLetter == false {
                startPointer += 1
                continue
            }
            
            if s[endIndex].isLetter == false {
                endPointer -= 1
                continue
            }
            
            if s[startIndex].lowercased() != s[endIndex].lowercased() { return false }
            
            startPointer += 1
            endPointer -= 1
        }
        
        return true
    }
}

let solution2 = Solution2()
solution2.isPalindrome("A man, a plan, a canal: Panama")
solution2.isPalindrome("race a car")
solution2.isPalindrome(" ")

