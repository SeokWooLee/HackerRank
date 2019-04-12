import Foundation

guard var n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

var maximumNumberOfConsecutive = 0
var currentNumberOfConsecutive = 0

while n > 0 {
    if n % 2 == 1 {
        currentNumberOfConsecutive += 1
    } else {
        currentNumberOfConsecutive = 0
    }
    
    if currentNumberOfConsecutive > maximumNumberOfConsecutive {
        maximumNumberOfConsecutive = currentNumberOfConsecutive
    }
    
    n /= 2
}

print(maximumNumberOfConsecutive)
