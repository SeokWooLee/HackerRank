import Foundation

// Complete the birthday function below.
func birthday(s: [Int], d: Int, m: Int) -> Int {
    let length = s.count
    
    return s
        .enumerated()
        .reduce(0) {
            let location = $1.offset
            guard location + m <= length else { return $0 }
            
            let sum = s[location..<location + m].reduce(0) { $0 + $1 }
            guard sum == d else { return $0 }

            return $0 + 1
        }
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let sTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let s: [Int] = sTemp.split(separator: " ").map {
    if let sItem = Int($0) {
        return sItem
    } else { fatalError("Bad input") }
}

guard s.count == n else { fatalError("Bad input") }

guard let dmTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let dm = dmTemp.split(separator: " ").map{ String($0) }

guard let d = Int(dm[0])
    else { fatalError("Bad input") }

guard let m = Int(dm[1])
    else { fatalError("Bad input") }

let result = birthday(s: s, d: d, m: m)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
