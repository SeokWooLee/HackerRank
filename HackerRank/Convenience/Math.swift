//
//  Math.swift
//  HackerRank
//
//  Created by SeokWoo Lee on 13/04/2019.
//  Copyright © 2019 SeokWoo Lee. All rights reserved.
//

import Foundation

struct Math {
    
    /// return GCD
    ///
    /// - Parameters:
    ///   - m: large value
    ///   - n: small value
    /// - Returns: GCD
    static func greatestCommonDivisor(m: Int, n: Int) -> Int {
        let r = m % n
        
        guard r != 0 else { return n }
        
        return greatestCommonDivisor(m: n, n: r)
    }
    
    static func leastCommomMultiple(lValue: Int, rValue: Int) -> Int {
        let sortedIntegers = [lValue, rValue].sorted()
        
        let gcd = greatestCommonDivisor(m: sortedIntegers[1], n: sortedIntegers[0])
        
        return gcd * (lValue / gcd) * (rValue / gcd)
    }
    
    static func divisors(for value: Int) -> [Int] {
        let squareRoot = Int(Double(value).squareRoot())
        
        let smallFactors = (1...squareRoot)
            .filter { value % $0 == 0 }
        
        let largeFactors: [Int] = smallFactors
            .reversed()
            .compactMap {
                let largeFactor = value / $0
                
                // Guard Duplicated
                guard largeFactor != $0 else { return nil }
                
                return largeFactor
        }
        
        return smallFactors + largeFactors
    }
    
}
