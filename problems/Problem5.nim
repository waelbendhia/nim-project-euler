import math
import primes
import common
import tables

proc joinFactors(
    f1s: OrderedTable[uint64, uint64], 
    f2s: OrderedTable[uint64, uint64],
): OrderedTable[uint64, uint64] =
    result = initOrderedTable[uint64, uint64]()
    for p, exp in f1s.pairs:
        result.add p, exp
    for p, exp in f2s.pairs:
        if result.contains p:
            result[p] = if result[p] > exp: result[p] else: exp
        else:
            result.add p, exp

proc primeFactors(n: uint64): OrderedTable[uint64, uint64] =
    result = initOrderedTable[uint64, uint64]()
    var x = n
    for p in primes():
        if p*p > n: break 
        var exp = 0u64
        while x mod p == 0:
            inc exp
            x = x div p
        if exp != 0: result.add p, exp
    if x > 1u64: result.add x, 1u64

proc solver(factors: seq[uint64]): uint64 =
    var fs = initOrderedTable[uint64, uint64]()
    result = 1u64
    for i in factors.items:
        fs = fs.joinFactors i.primeFactors
    for p, exp in fs.pairs:
        result *= p^exp

var ds: seq[uint64] = @[]
for i in 2u64..20: ds.add i

timeIt proc = echo solver ds
