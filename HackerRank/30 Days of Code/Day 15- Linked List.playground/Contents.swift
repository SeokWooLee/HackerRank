import Foundation

class Node {
    let data: Int
    var next: Node?
    
    init(data: Int) {
        self.data = data
    }
}

func insert(head: Node?, data: Int!) -> Node? {
    // Enter your code here.
    let node = Node(data: data)
    
    guard let head = head else { return node }
    
    var tail = head
    while let next = tail.next {
        tail = next
    }
    tail.next = node
    
    return head
}

func display(head: Node?) {
    var current = head
    
    while current != nil {
        print(current!.data, terminator: " ")
        current = current!.next
    }
}

var head: Node?
let n: Int = Int(readLine()!)!

for _ in 0..<n {
    let element = Int(readLine()!)!
    head = insert(head: head, data: element)
}

display(head: head)
