import Cocoa

/*
 242. Valid Anagram
 
 Given two strings s and t, return true if t is an anagram of s, and false otherwise.

 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
 
 
 Example 1:
 Input: s = "anagram", t = "nagaram"
 Output: true
 
 Example 2:
 Input: s = "rat", t = "car"
 Output: false
 
 */


/*
Solution1
 
Time: O(n)
Space: O(n)
 
 */

class Solution1 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        
        var sLetterCounter: [Character: Int] = [:]
        var tLetterCounter: [Character: Int] = [:]
        
        for i in s {
            if let value = sLetterCounter[i] {
                sLetterCounter[i] = value + 1
            } else {
                sLetterCounter[i] = 1
            }
        }
        
        for i in t {
            if let value = tLetterCounter[i] {
                tLetterCounter[i] = value + 1
            } else {
                tLetterCounter[i] = 1
            }
        }
        
        for i in s {
            if sLetterCounter[i] != tLetterCounter[i] { return false }
        }
        
        return true
    }
}

let solution1 = Solution1()
solution1.isAnagram("anagram", "nagaram")
solution1.isAnagram("car", "rat")
solution1.isAnagram("silent", "listen")
solution1.isAnagram("heart", "earth")
solution1.isAnagram("race", "reck")


/*
Solution2
 
Time: O(n)
Space: O(1)
 
 */

class Solution2 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let sSorted = s.sorted(by: >)
        let tSorted = t.sorted(by: >)
        
        for (i, v) in sSorted.enumerated() {
            if v != tSorted[i] { return false }
        }
        
        return true
    }
}

let solution2 = Solution1()
solution2.isAnagram("anagram", "nagaram")
solution2.isAnagram("car", "rat")
solution2.isAnagram("silent", "listen")
solution2.isAnagram("heart", "earth")
solution2.isAnagram("race", "reck")
