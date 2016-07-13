
module etl;


int[char] transform (string[int] score_map)
{

}

unittest
{
immutable int all_tests_enabled = 0;

// transform one value
{
	immutable string[int] old = [1: "A"];

	immutable auto actual = transform(old);
	immutable int[char] expected = ['a': 1];

	assert(expected == actual);
}

static if (all_tests_enabled)
{
// transform more values
{
	immutable string[int] old = [1: "AEIOU"];

	immutable auto actual = transform(old);
	immutable int[char] expected = ['a': 1, 'e': 1, 'i': 1, 'o': 1, 'u': 1];

	assert(expected == actual);
}

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

