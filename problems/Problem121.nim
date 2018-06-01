import math
import common
# After n playouts there are (n+1)! possible outcomes (counting repeated
# outcomes)
# To win a game we need to get at least n/2 + 1 blue ball

# This proc outputs an array A containing the number of playouts A[i] with i
# blue balls.
# for the nth playout the number of outcomes getting x blue balls is n*number
# of outcome getting x blue balls for the n-1 th playout (as there are n red
# balls) + number of outcomes getting x-1 blue balls for n-1th playout.  
proc blueBalls(turns: int): seq[int] =
    result = @[1,1]
    for p in 2..turns:
        for i in countdown(result.len - 1, 1):
            result[i] = p*result[i] + result[i-1]
        result[0] *= p
        result.add 1

proc maxPrize(turns: int): int =
    var sum = 0
    let balls = turns.blueBalls
    for i in turns div 2 + 1..turns:
        sum += balls[i]
    result = (turns + 1).fac div sum

timeIt proc = echo maxPrize 15