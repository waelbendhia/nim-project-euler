proc divisibleBy(n: uint64, ds: seq[uint64]): bool =
    for d in ds.items():
        if n mod d == 0:
            return true
        if d*d > n:
            return false

proc primesUnder(limit: uint64): seq[uint64] =
    result = @[2u64]
    var i = 3u64
    while i < limit:
        if not i.divisibleBy(result):
            result.add(i)
        i += 2

iterator primes*(): uint64 =
    var ps = @[2u64]
    yield 2u64
    var i = 3u64
    while true:
        if not i.divisibleBy ps:
            yield i
        i += 2
