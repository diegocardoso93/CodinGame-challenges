function distance( x1, y1, x2, y2 ) {
	return Math.sqrt( Math.pow(x2-x1, 2) + Math.pow(y2-y1, 2) )
}

var N = parseInt(readline());
var w = 0, xBefore = null, yBefore = null;

for (var i = 0; i < N; i++) {
    var inputs = readline().split(' ');
    
    if (x) {
        xBefore = x; yBefore = y;
    }
    var x = parseInt(inputs[0]);
    var y = parseInt(inputs[1]);
    
    if (xBefore) {
        if (xBefore<x) {
            w += distance(xBefore, yBefore, x, y);
        } else if (xBefore>y) {
            w -= distance(xBefore, yBefore, x, y);
        }
        if (yBefore<y) {
            w += distance(xBefore, yBefore, x, y);
        } else if (yBefore>y) {
            w -= distance(xBefore, yBefore, x, y);
        }
    }
    
}

if (w<0) {
    print('CLOCKWISE');
} else {
    print('COUNTERCLOCKWISE');
}