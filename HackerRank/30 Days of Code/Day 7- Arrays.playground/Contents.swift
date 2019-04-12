import Foundation

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let arrTemp = readLine() else { fatalError("Bad input") }
let arr = arrTemp.split(separator: " ")

guard arr.count == n else { fatalError("Bad input") }

print(arr
    .reversed()
    .joined(separator: " ")
)
