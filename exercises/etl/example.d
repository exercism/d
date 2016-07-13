
module etl;

import std.stdio;
import std.string;
import std.ascii : isUpper, isAlpha, toLower;
import std.algorithm.searching : countUntil;
import std.algorithm.iteration : each;
import std.algorithm.comparison : equal;
import std.algorithm.sorting : sort;
import std.typecons;

bool all_alpha_upper (string text)
{
	auto pos = countUntil!((dchar c) => !(isAlpha(c) || isUpper(c)))(text);
	return pos == -1;
}

int[char] transform (const string[int] score_map)
{
	int[char] new_map;

	foreach (entry; score_map.byKeyValue())
	{
		if (!all_alpha_upper(entry.value))
		{
			throw new Exception(format("Invalid input %s", entry.value));
		}

		entry.value.each!((char c) => new_map[toLower(c)] = entry.key);
	}

	return new_map;
}

unittest
{

Tuple!(char, const int)[] aa_sort(const int[char] aa)
{
	typeof(return) r=[];

	foreach(k, v; aa) r ~= tuple(k, v);
	sort!q{a[0]<b[0]}(r);

	return r;
}

bool aa_equal (const int[char] lhs, const int[char] rhs)
{
	return equal(aa_sort(lhs), aa_sort(rhs));
}

immutable int all_tests_enabled = 0;

// transform one value
{
	immutable string[int] old = [1: "A"];

	/*immutable*/const auto actual = transform(old);
	/*immutable*/const int[char] expected = ['a': 1];

	assert(equal(expected.byKey(), actual.byKey()));
	assert(equal(expected.byValue(), actual.byValue()));
}

// transform more values
{
	immutable string[int] old = [1: "AEIOU"];

	/*immutable*/const auto actual = transform(old);
	/*immutable*/const int[char] expected = ['a': 1, 'e': 1, 'i': 1, 'o': 1, 'u': 1];

	foreach (entry; actual.byKeyValue())
	{
		writefln("%s : %s", entry.key, entry.value);
	}

	assert(aa_equal(expected, actual));
}

static if (all_tests_enabled)
{
// transforms more keys
{
	immutable string[int] old = [1: "AE", 2: "DG"];

	immutable auto actual = transform(old);
	immutable int[char] expected = ['a': 1, 'e': 1, 'd': 2, 'g': 2];

	assert(expected == actual);
}

// transforms a full dataset
{
	immutable string[int] old = [1: "AEIOULNRST",
								2: "DG",
								3: "BCMP",
								4: "FHVWY",
								5: "K",
								8: "JX",
								10: "QZ"];

	immutable auto actual = transform(old);

	immutable int[char] expected = ['a': 1, 'b': 3,  'c': 3, 'd': 2, 'e': 1,
									'f': 4, 'g': 2,  'h': 4, 'i': 1, 'j': 8,
									'k': 5, 'l': 1,  'm': 3, 'n': 1, 'o': 1,
									'p': 3, 'q': 10, 'r': 1, 's': 1, 't': 1,
									'u': 1, 'v': 4,  'w': 4, 'x': 8, 'y': 4,
									'z': 10];

	assert(expected == actual);
}

}

}

void main ()
{
}

