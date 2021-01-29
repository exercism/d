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
