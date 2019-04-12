import Foundation

let testCase = Int(readLine()!)!

var dict: [String: String] = [:]

(0..<testCase)
    .forEach { _ in
        let keyValuePair = readLine()!
            .split(separator: " ")
            .map { String($0) }
        
        dict[keyValuePair[0]] = keyValuePair[1]
    }

while let query = readLine() {
    guard let value = dict[query] else { print("Not found"); continue }
    
    print("\(query)=\(value)")
}
