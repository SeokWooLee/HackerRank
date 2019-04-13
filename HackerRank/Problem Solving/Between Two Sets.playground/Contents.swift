import Foundation

extension Int {
    
    static func greatestCommonDivisor(m: Int, n: Int) -> Int {
        let r = m % n
        
        guard r != 0 else { return n }
        
        return greatestCommonDivisor(m: n, n: r)
    }
    
    static func leastCommomMultiple(lValue: Int, rValue: Int) -> Int {
        let sortedIntegers = [lValue, rValue].sorted()
        
        let gcd = greatestCommonDivisor(m: sortedIntegers[1], n: sortedIntegers[0])
        
        return gcd * (lValue / gcd) * (rValue / gcd)
    }
    
    var factors: [Int] {
        let squareRoot = Int(Double(self).squareRoot())
        
        let smallFactors = (1...squareRoot)
            .filter { self % $0 == 0 }
        
        let largeFactors: [Int] = smallFactors
            .reversed()
            .compactMap {
                let largeFactor = self / $0
                
                guard largeFactor != $0 else { return nil }
                
                return largeFactor
            }
        
        return (smallFactors + largeFactors)
    }
    
}

/*
 * Complete the getTotalX function below.
 */
func getTotalX(a: [Int], b: [Int]) -> Int {
    /*
     * Write your code here.
     */
    let sortedB = b.sorted(by: >)
    
    let lcm = a
        .reduce(1) { Int.leastCommomMultiple(lValue: $0, rValue: $1) }
    let gcd = sortedB
        .reduce(sortedB[0]) { Int.greatestCommonDivisor(m: $0, n: $1) }
    
    return gcd
        .factors
        .filter { $0 % lcm == 0 }
        .count
}

let fileName = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: fileName, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: fileName)!

guard let nmTemp = readLine() else { fatalError("Bad input") }
let nm = nmTemp.split(separator: " ").map{ String($0) }

guard let n = Int(nm[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let m = Int(nm[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let aTemp = readLine() else { fatalError("Bad input") }
let a: [Int] = aTemp.split(separator: " ").map {
    if let aItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return aItem
    } else { fatalError("Bad input") }
}

guard a.count == n else { fatalError("Bad input") }

guard let bTemp = readLine() else { fatalError("Bad input") }
let b: [Int] = bTemp.split(separator: " ").map {
    if let bItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return bItem
    } else { fatalError("Bad input") }
}

guard b.count == m else { fatalError("Bad input") }

let total = getTotalX(a: a, b: b)

fileHandle.write(String(total).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
