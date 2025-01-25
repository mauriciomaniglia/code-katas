/*

P03 (*) Find the Kth element of a linked list.

By convention, the first element in the list is element 0. Use Swift subscripts to get the value from the linked list.o:8

Example:

let list = List(1, 1, 2, 3, 5, 8)
list[2]

Result:

2

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

    subscript(index: Int) -> T? {
        var p = 0
        var c: List<T>? = self 

        while p != index {
            c = c?.nextItem            
            p += 1
        }

        return c?.value
    }
}

let list = List(1, 1, 2, 3, 5, 8)
print(list?[2] ?? -1)
