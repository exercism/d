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

unittest
{
    assert(!valid("1"));
    assert(!valid("0"));
    assert(valid("059"));
    assert(valid("59"));
    assert(valid("055 444 285"));
    assert(!valid("055 444 286"));
    assert(!valid("8273 1232 7352 0569"));
    assert(valid("095 245 88"));
    assert(valid("234 567 891 234"));
    assert(!valid("059a"));
    assert(!valid("055-444-285"));
    assert(!valid("055# 444$ 285"));
    assert(!valid(" 0"));
    assert(valid("0000 0"));
    assert(valid("091"));
    assert(!valid("055b 444 285"));
    assert(!valid(":9"));
}
