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
    
    /// Checks if a number is prime.
    /// - Parameter n: Number to check its primality.
    /// - Returns: true if the number is prime, false otherwise.
    public static func isPrime(n: Int) -> Bool {
        let sqr = Int(sqrt(Double(n)))
        let primes = primeNumbersUpTo(sqr)
        for prime in primes {
            if n % prime == 0 { return false }
        }
        return true
    }
    
    /// Calculates all factors of specified number. That is, all numbers that evenly divide that number.
    /// - Parameter n: Number to calculate all factors of.
    /// - Returns: A sorted array with all numbers that evenly divide `n`.
    public static func factorsOf(n: Int) -> [Int] {
        var factors = Set<Int>()
        var limit = n
        var i = 1
        while i <= limit {
            if n % i == 0 {
                factors.insert(i)
                factors.insert(n / i)
                limit = n / i
            }
            i += 1
        }
        return Array(factors).sort()
    }

    /// Finds the contiguous subarray within a one-dimensional array of numbers which has the largest sum.
    /// - Parameter array: One-dimensional array of numbers.
    /// - Returns: An optional tuple with three values: `sum` has the largest sum in a contiguous subarray
    ///     within `array`; `fromIndex` and `toIndex` are the initial and final indexes of that subarray 
    ///     within original `array`. Nil is returned if the original `array` is empty.
    public static func maximumSubarrayFrom(array: [Double]) -> (sum: Double, fromIndex: Int, toIndex: Int)? {
        guard !array.isEmpty else { return nil }
        
        var maxEndingHere = array[0]
        var maxSoFar = array[0]
        var fromIndex = 0
        var tempFromIndex = 0
        var toIndex = 0
        
        for (index, number) in array[1..<array.count].enumerate() {
            maxEndingHere = max(number, maxEndingHere + number)
            if maxEndingHere <= 0  {
                if maxEndingHere == number && maxEndingHere > maxSoFar { tempFromIndex = index + 1 }
                else { tempFromIndex = index + 2 }
            }
            if maxEndingHere > maxSoFar {
                toIndex = index + 1
                fromIndex = tempFromIndex
                maxSoFar = maxEndingHere
            }
        }

        return (sum: maxSoFar, fromIndex: fromIndex, toIndex: toIndex)
    }
    
}
