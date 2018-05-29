import common
import primes

proc solver(n: uint): uint64 =
    var i = 0u
    for p in primes():
        inc i
        if i == n: return p

timeIt proc () = echo solver 10001
