import common
import math

proc solver(limit: uint64): uint64 =
    var squareSum, sumSquare = 0u64
    for i in 1u64..limit:
        sumSquare += i
        squareSum += i^2
    return sumSquare^2 - squareSum

timeIt proc () = echo solver 100
