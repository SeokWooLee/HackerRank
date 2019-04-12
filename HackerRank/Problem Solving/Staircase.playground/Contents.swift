import Foundation

// Complete the staircase function below.
func staircase(n: Int) -> Void {
    (1...n).forEach { line in
        var sharps = ""
        (0..<n-line).forEach { space in
            sharps += " "
        }
        (n-line..<n).forEach { sharp in
            sharps += "#"
        }
        
        print(sharps)
    }
}

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

staircase(n: n)
