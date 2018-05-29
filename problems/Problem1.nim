import common

proc multiplesUnder(n, limit: uint64): uint64 =
    let terms = (limit - 1) div n 
    return (terms * (n + terms * n)) div 2

timeIt proc () =
    echo multiplesUnder(3, 1000) +
         multiplesUnder(5, 1000) -
         multiplesUnder(15, 1000)
