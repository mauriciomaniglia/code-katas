/*

P01 (*) Find the last element of a linked list.

Example:

List(1, 1, 2, 3, 5, 8).last

Result:

8

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

    var last: T? {
        return nil
    }
}







