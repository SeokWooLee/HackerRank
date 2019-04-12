import Foundation
import Darwin

let numStrings = Int(readLine()!)!

func printEvenAndOdd(string: String) {
    // This prints inputString to stderr for debugging:
    fputs("string: " + string + "\n", stderr)
    
    // Print the even-indexed characters
    // Write your code here
    let evenIndexedCharacters = string
        .enumerated()
        .filter { $0.offset % 2 == 0 }
        .map { $0.element }
    
    print(String(evenIndexedCharacters), terminator: "")
    
    // Print a space
    print(" ", terminator: "")
    
    // Print the odd-indexed characters
    // Write your code here
    let oddIndexedCharacters = string
        .enumerated()
        .filter { $0.offset % 2 == 1 }
        .map { $0.element }
    
    print(String(oddIndexedCharacters), terminator: "")
    
    // Print a newline
    print()
}

for _ in 1...numStrings {
    let inputString = readLine()!
    printEvenAndOdd(string: inputString)
}

