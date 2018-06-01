import common
import bignum

proc factorial[T: Ordinal](n: T): Int =
    if n < 2: return newInt(1)
    return newInt(n) * factorial(n-1)

proc sumDigits(n: Int): Int =
    if n < 10: return n
    return n mod newInt(10) + sumDigits(n div 10)

timeIt proc = echo sumDigits factorial 100
