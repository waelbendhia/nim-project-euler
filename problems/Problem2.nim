import common
import strutils
import times

proc sumFibs(limit: uint64): uint64 =
    var
        i0: uint64 = 0
        i1: uint64 = 1
    result = 0
    while true:
        i1 = i0 + i1
        i0 = i1 - i0
        if i1 >= limit:
            break
        if (i1 and 1) == 0:
            result += i1

timeIt proc = echo 4000000.sumFibs
