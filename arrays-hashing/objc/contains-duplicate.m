#import <Foundation/Foundation.h>

@interface Solution: NSObject

-(BOOL)containsDuplicate:(NSArray<NSNumber *> *)nums;

@end

@implementation Solution

- (BOOL)containsDuplicate:(NSArray<NSNumber *> *)nums {
    NSMutableSet *seenNumbers = [NSMutableSet set];

    for (NSNumber *num in nums) {
        if ([seenNumbers containsObject: num]) {
            return YES;
        }

        [seenNumbers addObject: num];
    }

    return NO;
}

@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Solution *solution = [Solution new];

        NSArray *nums1 = @[@1, @2, @3, @1];
        BOOL result1 = [solution containsDuplicate: nums1];
        NSLog(@"Test 1: %d", result1);

        NSArray *nums2 = @[@1, @2, @3, @4];
        BOOL result2 = [solution containsDuplicate: nums2];
        NSLog(@"Test 2: %d", result2);

        NSArray *nums3 = @[@1, @1, @1, @3, @3, @4, @3, @2, @4, @2];
        BOOL result3 = [solution containsDuplicate: nums3];
        NSLog(@"Test 3: %d", result3);
    }

    return 0;
}
