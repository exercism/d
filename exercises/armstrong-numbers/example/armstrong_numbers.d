module armstrong_numbers;

import std.algorithm.iteration : map, sum;
import std.conv : to;

pure bool isArmstrongNumber(immutable int number)
{
    immutable string s = number.to!string;
    immutable auto sum = s.map!(a => a.to!string
            .to!int ^^ s.length).sum;
    return sum == number;
}

unittest
{
    assert(isArmstrongNumber(0));
    assert(isArmstrongNumber(5));
    assert(!isArmstrongNumber(10));
    assert(isArmstrongNumber(153));
    assert(!isArmstrongNumber(100));
    assert(isArmstrongNumber(9474));
    assert(!isArmstrongNumber(9475));
    assert(isArmstrongNumber(9926315));
    assert(!isArmstrongNumber(9926314));
}
