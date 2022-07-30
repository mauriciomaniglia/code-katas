import Cocoa

/*
 49. Group Anagrams
 
 Given an array of strings strs, group the anagrams together. You can return the answer in any order.

 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
 
 
 Example 1:
 Input: strs = ["eat","tea","tan","ate","nat","bat"]
 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
 
 Example 2:
 Input: strs = [""]
 Output: [[""]]
 
 Example 3:
 Input: strs = ["a"]
 Output: [["a"]]
 */



/*
 Solution1
 
 Time: O(n)
 Space: O(n)
 */

class Solution1 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var group: [String: [String]] = [:]
        
        for i in strs {
            let sorted = String(i.sorted(by: >))
            
            if var anagramGroup = group[sorted] {
                anagramGroup.append(i)
                group[sorted] = anagramGroup
            } else {
                group[sorted] = [i]
            }
        }
        
        var anagrams: [[String]] = []
        
        for i in group.values {
            anagrams.append(i)
        }
        
        return anagrams
    }
}

let solution1 = Solution1()
solution1.groupAnagrams(["eat","tea","tan","ate","nat","bat"])
solution1.groupAnagrams([""])
solution1.groupAnagrams(["a"])
