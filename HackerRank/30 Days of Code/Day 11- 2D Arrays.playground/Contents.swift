import Foundation

let arr: [[Int]] = AnyIterator{ readLine() }.prefix(6).map {
    let arrRow: [Int] = $0.split(separator: " ").map {
        if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return arrItem
        } else { fatalError("Bad input") }
    }
    
    guard arrRow.count == 6 else { fatalError("Bad input") }
    
    return arrRow
}

guard arr.count == 6 else { fatalError("Bad input") }

var max = Int.min

(0...3).forEach { y in
    (0...3).forEach { x in
        var sum = 0
        
        (0..<3).forEach { innerY in
            (0..<3).forEach { innerX in
                guard innerY != 1 || innerX == 1 else { return }
                
                sum += arr[y+innerY][x+innerX]
            }
        }
        
        if sum > max {
            max = sum
        }
    }
}

print(max)
