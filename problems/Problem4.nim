import common
import math

proc isPalindrome(n: uint64): bool =
    if n < 10: return true
    var digits: seq[uint64] = @[]
    var x = n
    while x >= 10u64:
        digits.add(x mod 10)
        x = x div 10
    digits.add(x)
    for i in 0..digits.len() div 2:
        if digits[i] != digits[digits.len() - 1 - i]:
            return false
    return true

proc solver(digits: uint64): uint64 =
    let lo = 10u64^(digits - 1u64)
    let hi = 10u64^digits
    result = 0
    for i in lo..hi:
        for j in lo..i:
            let cur = i*j
            if cur > result and isPalindrome cur:
                result = cur

timeIt proc () = echo solver(3u64)
