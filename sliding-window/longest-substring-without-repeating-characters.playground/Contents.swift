import Cocoa

/*
 3. Longest Substring Without Repeating Characters
 
 Given a string s, find the length of the longest substring without repeating characters.
 
 Example 1:
 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 
 Example 2:
 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 
 Example 3:
 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */


/*
 Solution1
 
 Time: O(n^2)
 Space: O(n)
 */

class Solution1 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLength = 0
        var longestSubstring: [Character] = []
        
        for c in s {
            if !longestSubstring.contains(c) {
                longestSubstring.append(c)
            } else {
                if longestSubstring.count > maxLength {
                    maxLength = longestSubstring.count
                }
                longestSubstring = []
                longestSubstring.append(c)
            }
        }
        
        return maxLength
    }
}

let solution1 = Solution1()
solution1.lengthOfLongestSubstring("abcabcbb")
solution1.lengthOfLongestSubstring("bbbbb")
solution1.lengthOfLongestSubstring("pwwkew")


/*
 Solution2
 
 Time: O(n)
 Space: O(n)
 */

class Solution2 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLength = 0
        var longestSubstring: Set<Character> = []
        
        for c in s {
            if !longestSubstring.contains(c) {
                longestSubstring.insert(c)
            } else {
                if longestSubstring.count > maxLength {
                    maxLength = longestSubstring.count
                }
                longestSubstring = []
                longestSubstring.insert(c)
            }
        }
        
        return maxLength
    }
}

let solution2 = Solution2()
solution2.lengthOfLongestSubstring("abcabcbb")
solution2.lengthOfLongestSubstring("bbbbb")
solution2.lengthOfLongestSubstring("pwwkew")
