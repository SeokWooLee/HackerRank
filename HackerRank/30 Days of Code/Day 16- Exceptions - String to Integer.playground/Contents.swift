import Foundation

/*
 * Define an ErrorType
 */
enum StringToIntTypecastingError: Error {
    case BadString
}

/*
 * If typecasting is not possible, throw exception, otherwise return the Integer value
 */
func stringToInt(inputString: String) throws -> Int {
    // Write your code here
    guard let integer = Int(inputString) else { throw StringToIntTypecastingError.BadString }
    
    return integer
}

/*
 * Read the input
 */
let inputString = readLine()!

do {
    try print(stringToInt(inputString: inputString))
} catch StringToIntTypecastingError.BadString {
    print("Bad String")
}
