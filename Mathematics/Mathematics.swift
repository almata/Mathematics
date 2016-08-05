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
        guard n > 1 else { return false }
        
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
        guard n > 0 else { return [] }
        
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
    
    /// Calculates all prime factors of specified number. That is, all prime numbers that evenly divide that number.
    /// - Parameter n: Number to calculate all prime factors of.
    /// - Returns: A sorted array with all prime numbers that evenly divide `n`.
    public static func primeFactorsOf(n: Int) -> [Int] {
        guard n > 1 else { return [] }
        
        return Array(primeFactorizationOf(n).keys)
    }
    
    /// Calculates the prime factorization of specified number.
    /// - Parameter n: Number to calculate prime factorization of.
    /// - Returns: A dictionary with all prime factors, where keys are prime factors and values their exponents.
    public static func primeFactorizationOf(n: Int) -> [Int: Int] {
        guard n > 1 else { return [:] }
        
        let primeNumbers = primeNumbersUpTo(n)
        var factors = [Int: Int]()
        var m = n
        
        while m != 1 {
            for prime in primeNumbers {
                if m % prime == 0 {
                    factors[prime] = (factors[prime] ?? 0) + 1
                    m /= prime
                    break
                }
            }
        }
        
        return factors
    }
    
    /// Calculates the greatest common divisor of an array of numbers. That is, the largest positive integer that 
    /// divides all of those numbers without a remainder.
    /// - Parameter ns: Array of number to calculate the GCD of.
    /// - Returns: GCD if it exists or nil if array was empty or contained only zeros.
    public static func greatestCommonDivisorOf(ns: [Int]) -> Int? {
        guard !ns.isEmpty else { return nil }
        guard !ns.filter({ $0 != 0 }).isEmpty else { return nil }
        guard ns.count > 1 else { return ns[0] }
        
        var gcd = ns[0]
        for i in 1..<ns.count {
            var num = ns[i]
            if gcd > num { swap(&gcd, &num) }
            var remainder = 0
            repeat {
                remainder = gcd % num
                gcd = num
                num = remainder
            } while remainder != 0
        }
        return gcd
    }
    
    /// Calculates the least common multiple of an array of numbers. That is, the smallest positive integer that 
    /// is divisible by all of those numbers.
    /// - Parameter ns: Array of number to calculate the LCM of.
    /// - Returns: LCM if it exists or nil if array was empty or contained one or more zeros.
    public static func leastCommonMultipleOf(ns: [Int]) -> Int? {
        guard !ns.isEmpty else { return nil }
        guard ns.filter({ $0 == 0 }).isEmpty else { return nil }
        
        var lcm = ns[0]
        for i in 1..<ns.count {
            guard let gcd = greatestCommonDivisorOf([lcm, ns[i]]) else { return nil }
            lcm = abs(lcm * ns[i]) / gcd
        }
        return lcm
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
