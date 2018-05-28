import times

proc timeIt*(f: proc():void):void =
    let t = cpuTime()
    f()
    echo "Time taken: ", cpuTime() - t