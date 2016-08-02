
module etl;

import std.array : array;
import std.algorithm.sorting : sort;
import std.algorithm.comparison : equal;

unittest
{

// test associative array equality
bool aaEqual (const int[dchar] lhs, const int[dchar] rhs)
{
	auto lhs_pairs = lhs.byKeyValue.array;
	auto rhs_pairs = rhs.byKeyValue.array;
	lhs_pairs.sort!(q{a.key < b.key});
	rhs_pairs.sort!(q{a.key < b.key});

	return equal!("a.key == b.key && a.value == b.value")(lhs_pairs, rhs_pairs);
}

immutable int allTestsEnabled = 0;

// transform one value
{
	immutable string[int] old = [1: "A"];

	const auto actual = transform(old);
	const int[dchar] expected = ['a': 1];

	assert(aaEqual(expected, actual));
}

static if (allTestsEnabled)
{
// transform more values
{
	immutable string[int] old = [1: "AEIOU"];

	const auto actual = transform(old);
	const int[dchar] expected = ['a': 1, 'e': 1, 'i': 1, 'o': 1, 'u': 1];

	assert(aaEqual(expected, actual));
}

// transforms more keys
{
	immutable string[int] old = [1: "AE", 2: "DG"];

	const auto actual = transform(old);
	const int[dchar] expected = ['a': 1, 'e': 1, 'd': 2, 'g': 2];

	assert(aaEqual(expected, actual));
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

	assert(aaEqual(expected, actual));
}

}

}

void main ()
{
}

