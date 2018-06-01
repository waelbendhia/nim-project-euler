import common

proc collatzLengthsUnder(n: int): seq[int] =
    var collatz: seq[int] = @[0, 1]
    for i in 2..n: collatz.add(-1)
    proc getCollatz(i: int): int =
        let nextVal = if i mod 2 == 0: i div 2 else: 3*i + 1
        if i > collatz.len():
            return 1 + getCollatz nextVal
        if collatz[i] == -1:
            collatz[i] = 1 + getCollatz nextVal
        return collatz[i]
    for i in 0..n:
        let _ = getCollatz(i)
    return collatz

proc solve(limit: int): int =
    let collatz = collatzLengthsUnder limit
    var longest = 0
    for i in 0..collatz.len:
        if collatz[i] > longest:
            longest = collatz[i]
            result = i

timeIt proc = echo solve 1000000