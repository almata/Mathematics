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

## Functions included

### primeNumbersUpTo(n: Int) -> [Int] 

Function to calculate all prime numbers less than or equal to specified number. Prime numbers are calculated using the [Sieve of Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes) algorithm, as it is one of the most efficient ways to find all of the smaller primes and at the same time it is really simple to understand and implement.

Just for convenience reasons, the function is also provided as a new `lowerPrimeNumbers` property on `Int` using an extension.

#### Example 1

	Mathematics.primeNumbersUpTo(17)
    > [2, 3, 5, 7, 11, 13, 17]

#### Example 2

    13.primeNumbersUpTo
	> [2, 3, 5, 7, 11, 13]

### isPrime(n: Int) -> Bool

Function to check if a number is prime or not. It uses the simplest [primality test](https://en.wikipedia.org/wiki/Primality_test), which is trial division: given an input number *n*, it checks whether any prime integer *m* from 2 to √n evenly divides *n* (the division leaves no remainder). If *n* is divisible by any *m* then *n* is composite, otherwise it is prime.

For convenience reasons, the function is also provided as an `isPrime` property on `Int` using an extension.

#### Example 3

	Mathematics.isPrime(17)
    > true

#### Example 4

    1024.isPrime
	> false

### factorsOf(n: Int) -> [Int]

Function to calculate all factors of a number. That is, all positive integers that evenly divide that number. Please note that `factorsOf(:)` returns all factors of a number, regardless of whether they are prime numbers or not. There is a different function that returns all factors that happen to be prime numbers -- `primeFactorsOf(:)`. Both functions return all factors in a sorted array. 

For convenience reasons, the function is also provided as a `factors` property on `Int` using an extension.

#### Example 5

    Mathematics.factorsOf(1024)
    > [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]

#### Example 6

    2000.factors
    > [1, 2, 4, 5, 8, 10, 16, 20, 25, 40, 50, 80, 100, 125, 200, 250, 400, 500, 1000, 2000]

## Author

Albert Mata ([@almata](https://twitter.com/almata) on Twitter). Please find some more information about me and my work at my website [albertmata.net](http://www.albertmata.net).

## Hire me

I'm currently based in Barcelona and taking projects (permanent or contractor) all over Europe as long as you are OK with total or partial remote work (say I can be onsite one or two weeks a month if you need it). For more information, please check my projects at [albertmata.net/apps](http://albertmata.net/apps) or contact me at **hello@albertmata.net**.

## License

**Mathematics** is available under the MIT license. See the LICENSE file for more info. Please file an issue if you have any questions or if you would like to share how you are using this tool.
