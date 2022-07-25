class List<T> {
    var value: T
    var next: List<T>?

    convenience init?(_ values: T...) {
        self.init(Array(values))
    }

    init?(_ values: [T]) {
        guard let first = values.first else { return nil }
       
        self.value = first
        self.next = List(Array(values.suffix(from: 1)))
    }
}

extension List {
    //Find the last element of a linked list.

    var last: T? {
        var currentList = self.next

        while(currentList?.next != nil) {
            currentList = currentList?.next
        }

        return currentList?.value
    }

    //Find the last but one element of a linked list.
    
    var pennultimate: T? {
        var currentList = self.next

        while(currentList?.next?.next != nil) {
            currentList = currentList?.next
        }

        return currentList?.value
    }


    //Find the Kth element of a linked list.

    subscript(index: Int) -> T? {
        var currentIndex = 0 
        var currentList: List<T>? = self

        while(currentList != nil) { 
            if currentIndex == index { return currentList?.value }
            currentList = currentList?.next
            currentIndex += 1
        }

        return nil
    }
}

//print(List(1, 1, 2, 3, 5, 8)?.last as Any)
//print(List(1, 1, 2, 3, 5, 8)?.pennultimate as Any)

let list = List(1, 1, 2, 3, 5, 8)
print(list?[5])
