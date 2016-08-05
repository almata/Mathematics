//
//  MathematicsTests.swift
//  MathematicsTests
//
//  Created by Albert Mata Guerra on 02/08/16.
//  Copyright © 2016 Albert Mata Guerra. All rights reserved.
//

import XCTest
@testable import Mathematics

class MathematicsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPrimeNumbersUpTo() {
        XCTAssertEqual(Mathematics.primeNumbersUpTo(0), [])
        XCTAssertEqual(Mathematics.primeNumbersUpTo(1), [])
        XCTAssertEqual(Mathematics.primeNumbersUpTo(2), [2])
        XCTAssertEqual(Mathematics.primeNumbersUpTo(3), [2, 3])
        XCTAssertEqual(Mathematics.primeNumbersUpTo(5), [2, 3, 5])
        XCTAssertEqual(Mathematics.primeNumbersUpTo(10), [2, 3, 5, 7])
        XCTAssertEqual(Mathematics.primeNumbersUpTo(20), [2, 3, 5, 7, 11, 13, 17, 19])
    }
    
    func testIntPrimeNumbersUpTo() {
        XCTAssertEqual(5.primeNumbersUpTo, [2, 3, 5])
    }
    
    func testIsPrime() {
        XCTAssert(Mathematics.isPrime(5))
        XCTAssert(Mathematics.isPrime(17))
        XCTAssert(Mathematics.isPrime(104729))
        XCTAssert(!Mathematics.isPrime(4))
        XCTAssert(!Mathematics.isPrime(10000))
        XCTAssert(!Mathematics.isPrime(18369))
    }
    
    func testIntIsPrime() {
        XCTAssert(17.isPrime)
    }
    
    func testFactorsOf() {
        XCTAssertEqual(Mathematics.factorsOf(0), [])
        XCTAssertEqual(Mathematics.factorsOf(1), [1])
        XCTAssertEqual(Mathematics.factorsOf(2), [1, 2])
        XCTAssertEqual(Mathematics.factorsOf(3), [1, 3])
        XCTAssertEqual(Mathematics.factorsOf(5), [1, 5])
        XCTAssertEqual(Mathematics.factorsOf(10), [1, 2, 5, 10])
        XCTAssertEqual(Mathematics.factorsOf(20), [1, 2, 4, 5, 10, 20])
        XCTAssertEqual(Mathematics.factorsOf(100), [1, 2, 4, 5, 10, 20, 25, 50, 100])
    }
    
    func testIntFactors() {
        XCTAssertEqual(10.factors, [1, 2, 5, 10])
    }
    
    func testMaximumSubarrayFrom() {
        let tuple1 = Mathematics.maximumSubarrayFrom([2, -1, 2, 3, 4, -5])
        XCTAssertTrue(tuple1! == (sum: 10, fromIndex: 0, toIndex: 4))
        let tuple2 = Mathematics.maximumSubarrayFrom([8, -2, 6, -1, 3, -2, 4, 1, -6, 1])
        XCTAssertTrue(tuple2! == (sum: 17, fromIndex: 0, toIndex: 7))
        let tuple3 = Mathematics.maximumSubarrayFrom([1, -2, 6, -1, 3, -2, 4, 1, -6, 1, 8])
        XCTAssertTrue(tuple3! == (sum: 14, fromIndex: 2, toIndex: 10))
        let tuple4 = Mathematics.maximumSubarrayFrom([1, -2, 6, -1, 3, -2, 4, 3, 1, -6, 1, 2])
        XCTAssertTrue(tuple4! == (sum: 14, fromIndex: 2, toIndex: 8))
        let tuple5 = Mathematics.maximumSubarrayFrom([-3, -1, -2])
        XCTAssertTrue(tuple5! == (sum: -1, fromIndex: 1, toIndex: 1))
        let tuple6 = Mathematics.maximumSubarrayFrom([0, 0, 0])
        XCTAssertTrue(tuple6! == (sum: 0, fromIndex: 0, toIndex: 0))
        let tuple7 = Mathematics.maximumSubarrayFrom([])
        XCTAssertNil(tuple7)
        let tuple8 = Mathematics.maximumSubarrayFrom([-3, -2, -1, 0, -1, -2, -3])
        XCTAssertTrue(tuple8! == (sum: 0, fromIndex: 3, toIndex: 3))
        let tuple9 = Mathematics.maximumSubarrayFrom([1, 2, 3, 4, 5])
        XCTAssertTrue(tuple9! == (sum: 15, fromIndex: 0, toIndex: 4))
        let tuple10 = Mathematics.maximumSubarrayFrom([-3, -2, -1])
        XCTAssertTrue(tuple10! == (sum: -1, fromIndex: 2, toIndex: 2))
        let tuple11 = Mathematics.maximumSubarrayFrom([0, -1, 2, -1, 3, 4, 5, -3, 6, -1, 2, -5, 1, 2])
        XCTAssertTrue(tuple11! == (sum: 17, fromIndex: 2, toIndex: 10))
    }
    
    func testPrimeFactorsOf() {
        XCTAssertEqual(Mathematics.primeFactorsOf(0), [])
        XCTAssertEqual(Mathematics.primeFactorsOf(1), [])
        XCTAssertEqual(Mathematics.primeFactorsOf(2), [2])
        XCTAssertEqual(Mathematics.primeFactorsOf(3), [3])
        XCTAssertEqual(Mathematics.primeFactorsOf(5), [5])
        XCTAssertEqual(Mathematics.primeFactorsOf(10), [2, 5])
        XCTAssertEqual(Mathematics.primeFactorsOf(34), [2, 17])
    }
    
    func testIntPrimeFactors() {
        XCTAssertEqual(26.primeFactors, [2, 13])
    }
    
    func testPrimeFactorizationOf() {
        XCTAssertEqual(Mathematics.primeFactorizationOf(0), [:])
        XCTAssertEqual(Mathematics.primeFactorizationOf(1), [:])
        XCTAssertEqual(Mathematics.primeFactorizationOf(2), [2: 1])
        XCTAssertEqual(Mathematics.primeFactorizationOf(3), [3: 1])
        XCTAssertEqual(Mathematics.primeFactorizationOf(20), [2: 2, 5: 1])
        XCTAssertEqual(Mathematics.primeFactorizationOf(300), [2: 2, 3: 1, 5: 2])
    }
    
    func testIntPrimeFactorization() {
        XCTAssertEqual(3072.primeFactorization, [2: 10, 3: 1])
    }
    
    func testGreatestCommonDivisorOf() {
        let gcd1 = Mathematics.greatestCommonDivisorOf([])
        XCTAssertNil(gcd1)
        let gcd2 = Mathematics.greatestCommonDivisorOf([0])
        XCTAssertNil(gcd2)

        XCTAssertEqual(Mathematics.greatestCommonDivisorOf([2, -2]), 2)
        XCTAssertEqual(Mathematics.greatestCommonDivisorOf([-2, 2]), 2)
        XCTAssertEqual(Mathematics.greatestCommonDivisorOf([6, 20]), 2)
        XCTAssertEqual(Mathematics.greatestCommonDivisorOf([20, 6]), 2)
        XCTAssertEqual(Mathematics.greatestCommonDivisorOf([12, 24, 60]), 12)
        XCTAssertEqual(Mathematics.greatestCommonDivisorOf([2, 3, 5, 7]), 1)
        XCTAssertEqual(Mathematics.greatestCommonDivisorOf([250, 30, 20, 10]), 10)
        XCTAssertEqual(Mathematics.greatestCommonDivisorOf([10, 20, 30, 250, 5]), 5)
        XCTAssertEqual(Mathematics.greatestCommonDivisorOf([10, 20, 30, 250, 5, 3]), 1)
    }
    
    func testLeastCommonMultipleOf() {
        let lcm1 = Mathematics.leastCommonMultipleOf([])
        XCTAssertNil(lcm1)
        let lcm2 = Mathematics.leastCommonMultipleOf([10, 0])
        XCTAssertNil(lcm2)
        
        XCTAssertEqual(Mathematics.leastCommonMultipleOf([2, 5]), 10)
        XCTAssertEqual(Mathematics.leastCommonMultipleOf([12, 24, 48]), 48)
        XCTAssertEqual(Mathematics.leastCommonMultipleOf([5, 10, 15]), 30)
        XCTAssertEqual(Mathematics.leastCommonMultipleOf([5, -10, 15]), 30)
    }
    
    func testPerformanceLeastCommonMultipleOf() {
        self.measureBlock {
            XCTAssertEqual(Mathematics.leastCommonMultipleOf([345678, 234567, 123456]), 556132595913792)
        }
    }
    
}
