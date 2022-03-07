class LinkedListNode<T> {
	var value: T
	var next: LinkedListNode?
	weak var previous: LinkedListNode?

	init(value: T) {
		self.value = value
	}
}

class LinkedList<T> {
	typealias Node = LinkedListNode<T>

	var head: Node?

	var isEmpty: Bool {
		return head == nil
	}

	var first: Node? {
		return head
	}

	var last: Node? {
		guard var node = head else {
			return nil
		}

		while let next = node.next {
			node = next
		}

		return node
	}

	func append(value: T) {
		let newNode = Node(value: value)

		if let lastNode = last {
			newNode.previous = lastNode
			lastNode.next = newNode
		} else {
			head = newNode
		}
	}
}

let list = LinkedList<String>()
print(list.isEmpty)
print(list.first)

list.append(value:"Hello")
print(list.isEmpty)
print(list.first!.value)
print(list.last!.value)
