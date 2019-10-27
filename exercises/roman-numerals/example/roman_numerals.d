module roman_numerals;

import std.string;
import std.array;
import std.algorithm.sorting : sort;

import std.stdio;

// solution based on Kevlin Henney's ACCU talk
// https://www.youtube.com/watch?v=nrVIlhtoE3Y
//
// solution does not scale well with big numbers in terms of memory
// usage - it might even go out of memory - but it's interesting and
// given the "requirement" that the number should be at most 3000
// it's acceptable
string convert(ulong number)
{
    auto s = "I";
    return replicate(s, number).replace("IIIII", "V").replace("IIII", "IV")
        .replace("VV", "X").replace("VIV", "IX").replace("XXXXX", "L")
        .replace("XXXX", "XL").replace("LL", "C").replace("LXL", "XC")
        .replace("CCCCC", "D").replace("CCCC", "CD").replace("DD", "M").replace("DCD", "CM");
}
