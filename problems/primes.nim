proc coPrimeWith(n: uint64, ds: seq[uint64]): bool =
    for d in ds.items():
        if n mod d == 0:
            return false
        if d*d > n:
            return true
    return true

iterator primes*(): uint64 =
    var ps = @[2u64]
    yield 2u64
    var i = 3u64
    while true:
        if i.coPrimeWith ps:
            yield i
            ps.add i
        i += 2

proc createPrimeChecker*(limit: uint64): proc(_: uint64): bool =
    var lookup: seq[bool] = @[]
    for i in 0..(limit div 2 - 1): lookup.add true
    var i = 3u64
    while i*i < limit:
        if lookup[int((i div 2) - 1)]:
            var j = 3u64 * i
            while j < limit:
                lookup[int((j div 2) - 1)] = false
                j += 2u64 * i 
        i += 2
    return proc(x: uint64): bool =
                if x < 2: return false
                if x == 2: return true
                if (x and 1) == 0: return false
                return lookup[int((x div 2) - 1)]