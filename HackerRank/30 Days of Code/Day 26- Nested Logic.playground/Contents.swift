import Foundation

enum Hackos: Int {
    
    case year = 10000
    case month = 500
    case day = 15
    
}

func readDate() -> Date? {
    guard let rawValue = readLine() else { return nil }
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MM yyyy"
    
    return dateFormatter.date(from: rawValue)
}

guard let returnDate = readDate(),
    let dueDate = readDate() else { fatalError() }

let returnDateComponents = Calendar.current.dateComponents([.year, .month, .day], from: returnDate)
let dueDateComponents = Calendar.current.dateComponents([.year, .month, .day], from: dueDate)

if returnDate <= dueDate {
    print(0)
} else {
    let hackos: Int
    
    if returnDateComponents.year! > dueDateComponents.year! {
        hackos = Hackos.year.rawValue
    } else if returnDateComponents.month! > dueDateComponents.month! {
        hackos = Hackos.month.rawValue * (returnDateComponents.month! - dueDateComponents.month!)
    } else if returnDateComponents.day! > dueDateComponents.day! {
        hackos = Hackos.day.rawValue * (returnDateComponents.day! - dueDateComponents.day!)
    } else {
        hackos = 0
    }
    
    print(hackos)
}
