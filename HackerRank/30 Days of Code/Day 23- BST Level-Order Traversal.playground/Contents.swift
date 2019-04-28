// Start of Node class
class Node {
    var data: Int
    var left: Node?
    var right: Node?
    
    init(d : Int) {
        data  = d
    }
} // End of Node class

// Start of Tree class
class Tree {
    func insert(root: Node?, data: Int) -> Node? {
        if root == nil {
            return Node(d: data)
        }
        
        if data <= (root?.data)! {
            root?.left = insert(root: root?.left, data: data)
        } else {
            root?.right = insert(root: root?.right, data: data)
        }
        
        return root
    }
    
    func levelOrder(root: Node?) -> Void {
        guard let root = root else { return }
        
        nextOrder(roots: [root])
    } // End of levelOrder function
    
    private func nextRoots(_ roots: [Node]) -> [Node] {
        return roots.reduce([Node]()) {
            var nextRoots = $0
            
            if let left = $1.left {
                nextRoots.append(left)
            }
            
            if let right = $1.right {
                nextRoots.append(right)
            }
            
            return nextRoots
        }
    }
    
    private func nextOrder(roots: [Node]) -> Void {
        guard !roots.isEmpty else { return }
        
        roots.forEach { print($0.data, terminator: " ") }
        
        nextOrder(roots: nextRoots(roots))
    }
} // End of Tree class

var root: Node?
let tree = Tree()

let t = Int(readLine()!)!

for _ in 0..<t {
    root = tree.insert(root: root, data: Int(readLine()!)!)
}

tree.levelOrder(root: root)
