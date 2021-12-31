// Non optimal solution: Space O(n) Time O(n)
// Iteratively approach

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
    var revertList = Node(value: node.value)
    var currentNode = node    
    
    while revertList != nil {
        if let next = currentNode.next {
            currentNode = next
            let newNode = Node(value: next.value)
            newNode.next = revertList
            revertList = newNode
        } else {
            break
        }
    }

    return revertList
}

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3

print(node1)
print(revertLinkedList(node1))

