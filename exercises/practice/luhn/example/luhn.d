import std.ascii : isDigit, isWhite;
import std.algorithm;
import std.algorithm.searching : all;
import std.algorithm.mutation : reverse;
import std.conv : to;
import std.range : array;

pure bool valid(immutable string input)
{
    auto clean = input.filter!(a => !a.isWhite);
    if (clean.count <= 1 || !clean.all!(isDigit))
    {
        return false;
    }

    immutable int[] arr = clean.map!(to!string)
        .map!(to!int)
        .array
        .reverse;

    int doubleEverySecond = 0;

    foreach (index, number; arr)
    {
        immutable int b = index % 2 != 0 ? number * 2 : number;
        doubleEverySecond += b > 9 ? b - 9 : b;
    }

    return doubleEverySecond % 10 == 0;
}
