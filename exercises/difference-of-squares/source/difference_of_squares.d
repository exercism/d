module difference_of_squares;

unittest {
const int allTestsEnabled = 0;

    assert(squares(5).squareOfSum == 225);
static if (allTestsEnabled) {
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

}

void main() {}
