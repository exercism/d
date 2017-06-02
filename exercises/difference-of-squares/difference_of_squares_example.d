module difference_of_squares;

import std.range : iota;
import std.algorithm : sum, map;

struct Squares {
    this(uint max) pure {
        end = max + 1;
    }

    @property uint squareOfSum() const pure {
        return iota(end).sum ^^ 2;
    }

    @property uint sumOfSquares() const pure {
        return iota(end).map!"a ^^ 2".sum;
    }

    @property uint difference() const pure {
        return squareOfSum - sumOfSquares;
    }
    private uint end;
}

Squares squares(uint max) pure {
    return Squares(max);
}

unittest {
    assert(squares(5).squareOfSum == 225);
    assert(squares(10).squareOfSum == 3_025);
    assert(squares(100).squareOfSum == 25_502_500);

    assert(squares(5).sumOfSquares == 55);
    assert(squares(10).sumOfSquares == 385);
    assert(squares(100).sumOfSquares == 338_350);

    assert(squares(0).difference == 0);
    assert(squares(5).difference == 170);
    assert(squares(10).difference == 2_640);
    assert(squares(100).difference == 25_164_150);
}

void main () {}
