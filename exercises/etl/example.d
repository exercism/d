
module etl;

import std.stdio;
import std.string;
import std.ascii : isUpper, isAlpha, toLower;
import std.algorithm.searching : countUntil;
import std.algorithm.iteration : each;
import std.algorithm.comparison : equal;
import std.algorithm.sorting : sort;
import std.typecons;
import std.array : array;

bool all_alpha_upper (string text)
{
	auto pos = countUntil!((dchar c) => !(isAlpha(c) || isUpper(c)))(text);
	return pos == -1;
}

int[dchar] transform (const string[int] score_map)
{
	int[dchar] new_map;

	foreach (entry; score_map.byKeyValue())
	{
		if (!all_alpha_upper(entry.value))
		{
			throw new Exception(format("Invalid input %s", entry.value));
		}

		entry.value.each!((dchar c) => new_map[toLower(c)] = entry.key);
	}

	return new_map;
}

unittest
{

// delegate to use for the sort compare
/*bool aa_compare_by_key (Tuple!(dchar, const int) lhs, Tuple!(dchar, const int) rhs) @safe pure nothrow
{
	return lhs[0] < rhs[0];
}

Tuple!(dchar, const int)[] aa_sort(const int[dchar] aa)
{
	typeof(return) r = [];

	foreach(k, v; aa) r ~= tuple(k, v);
	//sort!(aa_compare_by_key)(r);
	sort!("a[0] < b[0]")(r);

	return r;
}*/

bool aa_equal (const int[dchar] lhs, const int[dchar] rhs)
{
	//return equal(aa_sort(lhs), aa_sort(rhs));

	auto lhs_pairs = lhs.byKeyValue.array;
	auto rhs_pairs = rhs.byKeyValue.array;
	lhs_pairs.sort!(q{a.key < b.key});
	rhs_pairs.sort!(q{a.key < b.key});

	/*foreach (const ref entry; lhs_pairs)
	{
		writefln("%s : %s", entry.key, entry.value);
	}
	foreach (const ref entry; rhs_pairs)
	{
		writefln("%s : %s", entry.key, entry.value);
	}*/

	return equal!("a.key == b.key && a.value == b.value")(lhs_pairs, rhs_pairs);
}

// transform one value
{
	immutable string[int] old = [1: "A"];

	/*immutable*/const auto actual = transform(old);
	/*immutable*/const int[dchar] expected = ['a': 1];

	assert(aa_equal(expected, actual));
}

// transform more values
{
	immutable string[int] old = [1: "AEIOU"];

	/*immutable*/const auto actual = transform(old);
	/*immutable*/const int[dchar] expected = ['a': 1, 'e': 1, 'i': 1, 'o': 1, 'u': 1];

	/*foreach (entry; actual.byKeyValue())
	{
		writefln("%s : %s", entry.key, entry.value);
	}*/

	assert(aa_equal(expected, actual));
}

// transforms more keys
{
	immutable string[int] old = [1: "AE", 2: "DG"];

	const auto actual = transform(old);
	const int[dchar] expected = ['a': 1, 'e': 1, 'd': 2, 'g': 2];

	assert(aa_equal(expected, actual));
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

	const auto actual = transform(old);

	const int[dchar] expected = ['a': 1, 'b': 3,  'c': 3, 'd': 2, 'e': 1,
								'f': 4, 'g': 2,  'h': 4, 'i': 1, 'j': 8,
								'k': 5, 'l': 1,  'm': 3, 'n': 1, 'o': 1,
								'p': 3, 'q': 10, 'r': 1, 's': 1, 't': 1,
								'u': 1, 'v': 4,  'w': 4, 'x': 8, 'y': 4,
								'z': 10];

	assert(aa_equal(expected, actual));
}

}

void main ()
{
}

