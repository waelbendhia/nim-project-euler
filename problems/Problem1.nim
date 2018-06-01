import common

proc multiplesUnder(n, limit: uint64): uint64 =
    let terms = (limit - 1) div n 
    return (terms * (n + terms * n)) div 2

timeIt proc () =
    echo 3.multiplesUnder(1000) +
         5.multiplesUnder(1000) -
         15.multiplesUnder(1000)
