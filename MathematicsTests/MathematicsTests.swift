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
    
}
