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

### Prime numbers

    primeNumbersUpTo(n: Int) -> [Int] 

Function to calculate all prime numbers less than or equal to specified number. Just for convenience reasons, the function is also provided as a new property on `Int` (`lowerPrimeNumbers`) using an extension.

Prime numbers are calculated using the [Sieve of Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes) algorithm, as it is one of the most efficient ways to find all of the smaller primes and at the same time it is really simple to understand and implement.

#### Example 1

	Mathematics.primeNumbersUpTo(17)

Output:

    [2, 3, 5, 7, 11, 13, 17]

#### Example 2

    13.lowerPrimeNumbers

Output:

	[2, 3, 5, 7, 11, 13]

## Author

Albert Mata ([@almata](https://twitter.com/almata) on Twitter). Please find some more information about me and my work at my website [albertmata.net](http://www.albertmata.net).

## Hire me

I'm currently based in Barcelona and taking projects (permanent or contractor) all over Europe as long as you are OK with total or partial remote work (say I can be onsite one or two weeks a month if you need it). For more information, please check my projects at [albertmata.net/apps](http://albertmata.net/apps) or contact me at **hello@albertmata.net**.

## License

**Mathematics** is available under the MIT license. See the LICENSE file for more info. Please file an issue if you have any questions or if you would like to share how you are using this tool.
