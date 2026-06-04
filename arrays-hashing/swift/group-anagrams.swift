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
 Solution1/Solution2

 Time Complexity: O(N⋅KlogK), where N is the number of strings and K is the maximum length of a string. 
 Sorting each string takes O(KlogK).

 Space Complexity: O(N⋅K) to store the strings inside the dictionary.
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
        
        return Array(group.values)    
    }
}

class Solution2 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var anagramMap = [String: [String]]()

        for str in strs {
            let sortedKey = String(str.sorted())

            anagramMap[sortedKey, default: []].append(str)
        }

        return Array(anagramMap.values)
    }
}

let solution1 = Solution1()
solution1.groupAnagrams(["eat","tea","tan","ate","nat","bat"])
solution1.groupAnagrams([""])
solution1.groupAnagrams(["a"])

