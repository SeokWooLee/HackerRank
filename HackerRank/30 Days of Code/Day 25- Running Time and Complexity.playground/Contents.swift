import Foundation

let testCase = Int(readLine() ?? "0") ?? 0

(0..<testCase)
    .forEach { _ in
        let input = Int(readLine() ?? "0") ?? 0
        
        guard input != 1 else { print("Not prime"); return }
        guard input > 3 else { print("Prime"); return }
        
        for index in 2...Int(Double(input).squareRoot()) {
            guard input % index != 0 else { print("Not prime"); return }
        }
        
        print("Prime")
}
