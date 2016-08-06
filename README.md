<p align="center">
    <img src="https://img.shields.io/badge/platform-iOS%208%2B-blue.svg?style=flat-square" alt="Platform: iOS 8+" />
    <img src="https://img.shields.io/badge/language-Swift%202-f48041.svg?style=flat-square" alt="Language: Swift 2" />
    <img src="http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat-square" alt="License: MIT" />
</p>

# Mathematics

**Mathematics** contains some maths-related static functions that may be handy at some time.

## Compatibility

**Mathematics** requires iOS 8+ and is compatible with Swift 2 projects.

## Installation

As this is (and probably will keep being) just a work in progress, there is no special method to install this library in your project. Just copy and paste the parts you may need. 

## List of functions

1. [primeNumbersUpTo](#1-primenumbersupto)
2. [isPrime](#2-isprime)
3. [factorsOf](#3-factorsof)
4. [primeFactorsOf](#4-primefactorsof)
5. [primeFactorizationOf](#5-primefactorizationof)
6. [greatestCommonDivisorOf](#6-greatestcommondivisorof)
7. [leastCommonMultipleOf](#7-leastcommonmultipleof)
8. [maximumSubarrayFrom](#8-maximumsubarrayfrom)

### 1. primeNumbersUpTo

```swift
primeNumbersUpTo(n: Int) -> [Int] 
```

Function to calculate all prime numbers less than or equal to specified number. Prime numbers are calculated using the [Sieve of Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes) algorithm, as it is one of the most efficient ways to find all of the smaller primes and at the same time it is really simple to understand and implement.

Just for convenience reasons, the function is also provided as a new `lowerPrimeNumbers` property on `Int` using an extension.

#### Example

```swift
Mathematics.primeNumbersUpTo(17)
> [2, 3, 5, 7, 11, 13, 17]
```

#### Example

```swift
13.primeNumbersUpTo
> [2, 3, 5, 7, 11, 13]
```

### 2. isPrime

```swift
isPrime(n: Int) -> Bool
```

Function to check if a number is prime or not. It uses the simplest [primality test](https://en.wikipedia.org/wiki/Primality_test), which is trial division: given an input number *n*, it checks whether any prime integer *m* from 2 to √n evenly divides *n* (the division leaves no remainder). If *n* is divisible by any *m* then *n* is composite, otherwise it is prime.

For convenience reasons, the function is also provided as an `isPrime` property on `Int` using an extension.

#### Example

```swift
Mathematics.isPrime(17)
> true
```

#### Example

```swift
1024.isPrime
> false
```

### 3. factorsOf

```swift
factorsOf(n: Int) -> [Int]
```

Function to calculate all factors of a number. That is, all positive integers that evenly divide that number. Please note that `factorsOf(:)` returns all factors of a number, regardless of whether they are prime numbers or not. There is a different function that returns all factors that happen to be prime numbers -- `primeFactorsOf(:)`. Both functions return all factors in a sorted array. 

For convenience reasons, the function is also provided as a `factors` property on `Int` using an extension.

#### Example

```swift
Mathematics.factorsOf(1024)
> [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]
```

#### Example

```swift
2000.factors
> [1, 2, 4, 5, 8, 10, 16, 20, 25, 40, 50, 80, 100, 125, 200, 250, 400, 500, 1000, 2000]
```

### 4. primeFactorsOf

```swift
primeFactorsOf(n: Int) -> [Int]
```

Function to calculate all prime factors of a number. That is, all prime numbers that divide that integer exactly. Prime factors are returned in a sorted array.

For convenience reasons, the function is also provided as a `primeFactors` property on `Int` using an extension.

#### Example

```swift
Mathematics.primeFactorsOf(34)
> [2, 17]
```

#### Example

```swift
26.primeFactors
> [2, 13]
```

### 5. primeFactorizationOf

```swift
primeFactorizationOf(n: Int) -> [Int: Int]
```

Function to calculate the prime factorization of a number. That is, a list of the integer's prime factors, together with their multiplicities. The process of determining these factors is called integer factorization. The fundamental theorem of arithmetic says that every positive integer has a single unique prime factorization. The prime factorization is returned as a dictionary where keys are the prime factors and values their exponents.

For convenience reasons, the function is also provided as a `primeFactorization` property on `Int` using an extension.

#### Example

```swift
Mathematics.primeFactorizationOf(300)
> [2: 2, 3: 1, 5: 2])
```

#### Example

```swift
3072.primeFactorization
> [2: 10, 3: 1]
```

### 6. greatestCommonDivisorOf

```swift
greatestCommonDivisorOf(ns: [Int]) -> Int?
```

Function to calculate the Greatest Common Divisor of an array of numbers. That is, the largest positive integer that divides all those numbers without a remainder. The GCD can in principle be computed by determining the prime factorizations of all the numbers and comparing factors. However, a much more efficient method is the Euclidean algorithm, which uses a division algorithm such as long division in combination with the observation that the GCD of two numbers also divides their difference. For example, to compute GCD(48,18), we divide 48 by 18 to get a quotient of 2 and a remainder of 12. Then we divide 18 by 12 to get a quotient of 1 and a remainder of 6. Finally we divide 12 by 6 to get a remainder of 0, which means that 6 is the GCD. Note that we ignored the quotient in each step except to notice when the remainder reached 0, signalling that we had arrived at the answer.

This **Mathematics** library uses the Euclidean algorithm for performance reasons.

#### Example

```swift
Mathematics.greatestCommonDivisorOf([12, 24, 60])
> 12
```

### 7. leastCommonMultipleOf

```swift
leastCommonMultipleOf(ns: [Int]) -> Int?
```

Function to calculate the Least Common Multiple of an array of numbers. That is, the smallest positive integer that is divisible by all of those numbers. There are different ways to calculate the Least Common Multiple of two (or *n*) numbers. One way, maybe the most intuitive, is finding the prime factorization of each number and then using those factors to calculate the LCM. The unique factorization theorem says that every positive integer greater than 1 can be written in only one way as a product of prime numbers. The prime numbers can be considered as the atomic elements which, when combined together, make up a composite number. This way works perfectly and it would look something like this in Swift (assuming `ns` is the array of numbers to get the LCM of):

```swift
var factors = [Int: Int]()
for n in ns.map({ abs($0) }) {
    let primeFactorization = primeFactorizationOf(n)
    primeFactorization.forEach { if (factors[$0] ?? 0) < $1 { factors[$0] = $1 }}
}
return Int(factors.reduce(1.0) { $0 * pow(Double($1.0), Double($1.1)) })
```

However, there is another way much more efficient using this formula that reduces the problem of computing the LCM to the problem of computing the Greatest Common Divisor (GCD):

	LCM(a,b) = |a * b| / GCD(a,b)

In Swift it could be done with the following code (again, assuming `ns` is the array of numbers to get the LCM of):

```swift
var lcm = ns[0]
for i in 1 ..< ns.count {
    guard let gcd = greatestCommonDivisorOf([lcm, ns[i]]) else { return nil }
    lcm = abs(lcm * ns[i]) / gcd
}
return lcm
```

Assuming the GCD is calculated using Euclid's algorithm instead of prime factorization, this last approach is much more efficient.

This **Mathematics** library uses Euclid's algorithm for GCD and the formula above for LCM, so neither of `greatestCommonDivisorOf(_:)` and `leastCommonMultipleOf(_:)` uses prime factorization (and so they return the result in literally no time).

#### Example

```swift
Mathematics.leastCommonMultipleOf([345678, 234567, 123456])
> 556132595913792
```

_With numbers like these is when using the most efficient algorithm really matters._

### 8. maximumSubarrayFrom

```swift
maximumSubarrayFrom(array: [Double]) -> (sum: Double, fromIndex: Int, toIndex: Int)?
```

From the [Wikipedia](https://en.wikipedia.org/wiki/Maximum_subarray_problem), in computer science, the maximum subarray problem is the task of finding the contiguous subarray within a one-dimensional array of numbers which has the largest sum. For example, for the sequence of values −2, 1, −3, 4, −1, 2, 1, −5, 4; the contiguous subarray with the largest sum is 4, −1, 2, 1, with sum 6.

The function provided here uses an algorithm based on Kadane's algorithm and modified so it can a) deal with arrays where all numbers are negative numbers and b) keep track of the starting and ending indices of the maximum subarray.

Original Kadane's algorithm consists of a scan through the array values, computing at each position the maximum (positive sum) subarray ending at that position. This subarray is either empty (in which case its sum is zero) or consists of one more element than the maximum subarray ending at the previous position. The algorithm only needs to keep track of the ending position because the implied starting position is just after the last position at which the sum went negative; a higher sum can always be found by dropping any negative-sum prefix.

#### Example

```swift
Mathematics.maximumSubarrayFrom([0, -1, 2, -1, 3, 4, 5, -3, 6, -1, 2, -5, 1, 2])!
> (17.0, 2, 10)
```

The `(17.0, 2, 10)` tuple indicates maximum subarray is the one from index 2 to index 10 in the original array, so `[2, -1, 3, 4, 5, -3, 6, -1, 2]`. And the sum of all numbers in that subarray is 17.

## Author

Albert Mata ([@almata](https://twitter.com/almata) on Twitter). Please find some more information about me and my work at my website [albertmata.net](http://www.albertmata.net).

## Hire me

I'm currently based in Barcelona and taking projects (permanent or contractor) all over Europe as long as you are OK with total or partial remote work (say I can be onsite one or two weeks a month if you need it). For more information, please check my projects at [albertmata.net/apps](http://albertmata.net/apps) or contact me at **hello@albertmata.net**.

## License

**Mathematics** is available under the MIT license. See the LICENSE file for more info. Please file an issue if you have any questions or if you would like to share how you are using this tool.
