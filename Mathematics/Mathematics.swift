//
//  Mathematics.swift
//  Mathematics
//
//  Created by Albert Mata Guerra on 02/08/16.
//  Copyright © 2016 Albert Mata Guerra. All rights reserved.
//

import Foundation

public struct Mathematics {
    
    /// Calculates all prime numbers less than or equal to specified number.
    /// - Parameter n: Number to calculate all prime numbers less than or equal to.
    /// - Returns: A sorted array with all prime numbers less than or equal to `n`.
    public static func primeNumbersUpTo(n: Int) -> [Int] {
        guard n > 1 else { return [] }
        
        // First we build this array [0, 0, 2, 3, 4, 5, 6, 7, 8, 9, ..., n].
        var array = Array(count: n + 1, repeatedValue: 0)
        for i in 2...n {
            array[i] = i
        }
        
        // Then we use the Sieve of Eratosthenes method to get [0, 0, 2, 3, 0, 5, 0, 7, 0, 0, ..., n or 0].
        for i in 2...n {
            if array[i] != 0 {
                var j = i * 2
                while j <= n {
                    array[j] = 0
                    j += i
                }
            }
        }
        
        return array.filter{ $0 != 0 }
    }
    
}