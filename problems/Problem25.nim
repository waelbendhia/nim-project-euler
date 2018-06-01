import common
import bignum

proc solve(length: int): int =
    var i0 = newInt 0
    var i1 = newInt 1
    var i = 1
    while true:
        if i1.digits >= length:
            return i + 1
        inc i
        i1 = i1 + i0
        i0 = i1 - i0

timeIt proc = echo solve 1000