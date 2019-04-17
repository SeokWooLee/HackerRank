import Foundation

/*
 * Complete the pageCount function below.
 */
func pageCount(n: Int, p: Int) -> Int {
    /*
     * Write your code here.
     */
    let left = p / 2
    let numberOfPages = (n + 2) / 2
    
    return min(left, numberOfPages - left - 1)
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let p = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

let result = pageCount(n: n, p: p)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
