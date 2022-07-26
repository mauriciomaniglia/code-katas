/* Complexity Analysis:

- Time Complexity: O(n).
The array needs to be traversed three times, so the time complexity is O(n).

- Space Complexity: O(n).
Two extra arrays and one array to store the output is needed so the space complexity is O(n)

*/

func productArray(_ values: [Int]) -> [Int] {
    var product = Array(repeating: 1, count: values.count)    
    var left = product
    var right = product

    var i = 1
    while (i < values.count) {
        left[i] = values[i-1] * left[i-1]
        i += 1    
    }

    var j = values.count - 2
    while (j >= 0) {
        right[j] = values[j+1] * right[j+1]
        j -= 1
    }

    for (index, _) in values.enumerated() {
        product[index] = left[index] * right[index]
    }

    return product
}

print(productArray([10, 3, 5, 6, 2]))
