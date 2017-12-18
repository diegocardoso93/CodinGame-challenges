function convert_timestamp(h, i, s){
    return parseInt(s) + parseInt(i)*60 + parseInt(h)*60*60;
}

var N = parseInt(readline())
smalest = null;
for (var i = 0; i < N; i++) {
    var t = readline()
    k = t.split(":")
    tst = convert_timestamp(k[0], k[1], k[2])
    if (smalest === null) {
        smalest = tst
        ts = t
    }else if (tst < smalest) {
        smalest = tst
        ts = t
    }
}

print(ts)
