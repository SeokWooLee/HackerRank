import Foundation

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

(1...10)
    .forEach { print("\(n) x \($0) = \(n * $0)") }
