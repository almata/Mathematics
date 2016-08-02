//
//  Int+Mathematics.swift
//  Mathematics
//
//  Created by Albert Mata Guerra on 02/08/16.
//  Copyright © 2016 Albert Mata Guerra. All rights reserved.
//

import Foundation

public extension Int {
    
    public var primeNumbersUpTo: [Int] {
        return Mathematics.primeNumbersUpTo(self)
    }
    
    public var isPrime: Bool {
        return Mathematics.isPrime(self)
    }
    
}