import Foundation

/*
 * Complete the gradingStudents function below.
 */
func gradingStudents(grades: [Int]) -> [Int] {
    /*
     * Write your code here.
     */
    return grades.map {
        guard $0 >= 38 else { return $0 }
        
        let remainder = $0 % 5
        guard remainder < 3 else { return $0 - remainder + 5 }
        
        return $0
    }
}

let fileName = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: fileName, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: fileName)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

let grades: [Int] = AnyIterator{ readLine() }.prefix(n).map {
    if let gradesItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return gradesItem
    } else { fatalError("Bad input") }
}

guard grades.count == n else { fatalError("Bad input") }

let result = gradingStudents(grades: grades)

fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
