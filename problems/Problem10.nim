import primes
import common

proc solver(n: uint64): uint64 = 
    for p in primes():
        if p > n: break
        result += p

timeIt proc () = echo solver 2000000u64