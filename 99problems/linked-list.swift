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
    
    // Find the number of elements of a linked list.
    
    var length: Int {
        var total = 0
        var currentList: List<T>? = self
        
        while(currentList != nil) {
            total += 1
            currentList = currentList?.next
        }
        
        return total
    }
    
    // Reverse a linked list.
    
    func reverse() {
        var next: List<T>? = nil
        var current: List<T>? = self
        var previous: List<T>? = nil
        
        while (current != nil) {
            next = current?.next
            previous = current
            current = next
        }
    }
}

let list = List(1, 2, 3, 4, 5, 6)!
