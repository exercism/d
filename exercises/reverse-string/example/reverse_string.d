module reverse_string;

import std.algorithm.mutation;

pure string reverseString(immutable string value)
{
    return value.dup.reverse;
}

unittest
{
    assert(reverseString("") == "");
    assert(reverseString("robot") == "tobor");
    assert(reverseString("Ramen") == "nemaR");
    assert(reverseString("I'm hungry!") == "!yrgnuh m'I");
    assert(reverseString("racecar") == "racecar");
    assert(reverseString("drawer") == "reward");
}
