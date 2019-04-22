import Foundation

class Difference {
    private var elements = [Int]()
    var maximumDifference: Int
    // Write your code here
    init(a: [Int]) {
        self.elements = a
        self.maximumDifference = 0
    }
    
    func computeDifference() {
        let sortedElements = self.elements.sorted()
        
        guard let first = sortedElements.first,
            let last = sortedElements.last else { return }
        
        self.maximumDifference = Int((last - first).magnitude)
    }
} // End of Difference class

let n = Int(readLine()!)!
let a = readLine()!.components(separatedBy: " ").map{ Int($0)! }

let d = Difference(a: a)

d.computeDifference()

print(d.maximumDifference)
