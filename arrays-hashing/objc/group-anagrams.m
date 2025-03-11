/**

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

**/

#import <Foundation/Foundation.h>

NSArray<NSArray<NSString *> *> *groupAnagrams(NSArray<NSArray<NSString *> *> *strs) {

    NSMutableDictionary<NSString *, NSMutableArray<NSString *> *> *anagramMap = [NSMutableDictionary dictionary];

    for (NSString *str in strs) {

        NSMutableArray *chars = [NSMutableArray array];
        [str enumerateSubstringsInRange: NSMakeRange(0, str.length)
                                options: NSStringEnumerationByComposedCharacterSequences
                             usingBlock: ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
            [chars addObject: substring];
        }];

        [chars sortUsingSelector:@selector(compare:)];

        NSString *sortedKey = [chars componentsJoinedByString: @""];

        if (!anagramMap[sortedKey]) {
            anagramMap[sortedKey] = [NSMutableArray array];
        }

        [anagramMap[sortedKey] addObject:str];
    }

    return [anagramMap allValues];
}

void testGroupAnagrams() {
    // Test case 1
    NSArray *test1 = @[@"eat", @"tea", @"tan", @"ate", @"nat", @"bat"];
    NSArray *result1 = groupAnagrams(test1);
    NSLog(@"Test 1: %@", result1);

    // Test case 2
    NSArray *test2 = @[@""];
    NSArray *result2 = groupAnagrams(test2);
    NSLog(@"Test 2: %@", result2);

    // Test case 3
    NSArray *test3 = @[@"a"];
    NSArray *result3 = groupAnagrams(test3);
    NSLog(@"Test 3: %@", result3);
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        testGroupAnagrams();
    }

    return 0;
}
