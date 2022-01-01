// Iteratively approach: Time O(n)

class Node<Value> {
    var value: Value
    var next: Node?

    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }

        return "\(value) -> " + String(describing: next) + " "
    }
}

func revertLinkedList(_ node: Node<Int>) -> Node<Int> {
    var prev: Node<Int>? 
    var current = node    
    
    while current != nil { 
        if let next = current.next {
            current.next = prev
            prev = current
            current = next
        } else {
            current.next = prev
            break
        }
    }

    return current
}

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3

print(node1)
print(revertLinkedList(node1))

