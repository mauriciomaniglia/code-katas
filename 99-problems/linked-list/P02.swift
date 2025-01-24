/*

P02 (*) Find the last but one element of a linked list.

Example:

List(1, 1, 2, 3, 5, 8).pennultimate

Result:

5

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

    var pennultimate: T? {
        if nextItem?.nextItem == nil {
            return value
        } else {
            return nextItem?.pennultimate
        }
    }
}

let list = List(1, 1, 2, 3, 5, 8)
print(list?.pennultimate ?? -1)






