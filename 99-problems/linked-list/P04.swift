/*

P04 (*) Find the number of elements of a linked list.

Example:

List(1, 1, 2, 3, 5, 8).length

Result:

6

*/


class List<T> {
    var value: T
    var nextItem: List<T>?

    convenience init?(_ values: T...) {
        self.init(Array(values))
    }

    init?(_ values: [T]) {
        guard let first = values.first else {
            return nil
        }
        value = first
        nextItem = List(Array(values.suffix(from: 1)))
    }

    var length: Int {
        var count = 1 
        var current: List<T>? = self

        while current?.nextItem != nil {
            count += 1
            current = current?.nextItem
        }

        return count
    }
}

let list = List(1, 1, 2, 3, 5, 8)
print(list?.length ?? -1)






