import Foundation

// Complete the plusMinus function below.
func plusMinus(arr: [Int]) -> Void {
    var countArray = [0.0, 0.0, 0.0]
    
    arr.forEach {
        if $0 > 0 {
            countArray[0] += 1
        } else if $0 < 0 {
            countArray[1] += 1
        } else {
            countArray[2] += 1
        }
    }
    
    let count = Double(arr.count)
    countArray.forEach { print(String(format: "%.6f", ($0 / count))) }
}

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let arrTemp = readLine() else { fatalError("Bad input") }
let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

plusMinus(arr: arr)
