import math
import common

proc isPrime(n: uint64): bool =
    if (n and 1) == 0:
        return false
    var i = 3u64
    while i*i < n:
        if n mod i == 0:
            return false
        i += 1
    return true

proc largestPrimeFactor(n: uint64): uint64 =
    for i in countdown(uint64(sqrt float(n)), uint64(2)):
        if n mod i == 0 and isPrime i:
            return i
    return 0

proc solve() = echo largestPrimeFactor 600851475143u

timeIt solve