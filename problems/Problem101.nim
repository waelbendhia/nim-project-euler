import common
import math

proc terms[I,T](fs: array[I,T]): array[I,T] =
    for x in T(1)..T(fs.len-1):
        var y : T = 0
        for n in T(0)..T(fs.len-1):
            y += (x^n) * fs[n]
        result[x] = y

# Calculate FIT using Lagrange polynomial
# https://en.wikipedia.org/wiki/Lagrange_polynomial
proc lagrangeFIT[I, T](degree: int, vals: array[I,T]): T =
    result = 0
    for xi in 1..degree:
        var numerator, denumerator = 1
        for xj in 1..degree:
            if xj == xi: continue
            numerator *= degree + 1 - xj
            denumerator *= xi - xj
        result += (numerator*vals[xi]) div denumerator

proc sumFITS[I,T](poly: array[I,T]): T =
    let vals = poly.terms
    for i in 1..vals.len - 1: result += i.lagrangeFIT vals

timeIt proc = echo [1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1].sumFITS