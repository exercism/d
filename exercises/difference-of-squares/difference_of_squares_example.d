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
