import common
import sets

proc sumProperDivisors[T](n: T): T =
    var i: T = 2
    result = 1
    while i*i <= n:
        if n mod i == 0: result += i + (n div i)
        inc i

proc allAmicableNumbersUnder[T](limit: T): HashSet[T] =
    result.init
    for i in T(1)..limit:
        if result.contains i: continue
        let spd = i.sumProperDivisors
        if i != spd and i == spd.sumProperDivisors:
            result.incl i
            result.incl spd

timeIt proc() =
    let nums = 10000.allAmicableNumbersUnder
    var sum = 0
    for n in nums.items:
        sum += n
    echo sum