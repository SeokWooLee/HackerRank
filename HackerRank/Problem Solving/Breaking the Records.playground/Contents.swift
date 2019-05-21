import Foundation

// Complete the breakingRecords function below.
func breakingRecords(scores: [Int]) -> [Int] {
    var breakingCounts = [0, 0]
    
    var max = scores[0] {
        didSet {
            breakingCounts[0] += 1
        }
    }
    var min = scores[0] {
        didSet {
            breakingCounts[1] += 1
        }
    }
    scores
        .enumerated()
        .forEach {
            guard $0.offset > 0 else { return }
            
            if $0.element > max {
                max = $0.element
            }
            
            if $0.element < min {
                min = $0.element
            }
        }
    
    
    return breakingCounts
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let scoresTemp = readLine() else { fatalError("Bad input") }
let scores: [Int] = scoresTemp.split(separator: " ").map {
    if let scoresItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return scoresItem
    } else { fatalError("Bad input") }
}

guard scores.count == n else { fatalError("Bad input") }

let result = breakingRecords(scores: scores)

fileHandle.write(result.map{ String($0) }.joined(separator: " ").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
