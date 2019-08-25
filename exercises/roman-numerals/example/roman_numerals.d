
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
string convert (ulong number)
{
	auto s = "I";
	return replicate(s, number).replace("IIIII", "V").replace("IIII", "IV").replace("VV", "X")
							.replace("VIV", "IX").replace("XXXXX", "L").replace("XXXX", "XL")
							.replace("LL", "C").replace("LXL", "XC").replace("CCCCC", "D")
							.replace("CCCC", "CD").replace("DD", "M").replace("DCD", "CM");
}

// alternative implementation
string convertAlt (ulong number)
{
	string[int] multiples = [
							1000: "M", 900: "CM", 500: "D", 400: "CD",
							100: "C", 90: "XC", 50: "L", 40: "XL", 10: "X",
							9: "IX", 5: "V", 4: "IV", 1: "I"
							];
	string result = "".dup;
	// the converison pairs need to be tried in descending order
	auto pairs = multiples.byKeyValue.array;
	pairs.sort!(q{a.key > b.key});
	foreach (entry; pairs)
	{
		result ~= replicate(entry.value, number / entry.key);
		number %= entry.key;
	}

	return result;
}
