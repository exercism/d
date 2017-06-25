
module nucleotide_count;

import std.string;
import std.array;
import std.algorithm.sorting: sort;
import std.algorithm.comparison: equal;

unittest
{

// test associative array equality
bool aaEqual (const ulong[char] lhs, const ulong[char] rhs)
{
	auto lhs_pairs = lhs.byKeyValue.array;
	auto rhs_pairs = rhs.byKeyValue.array;
	lhs_pairs.sort!(q{a.key < b.key});
	rhs_pairs.sort!(q{a.key < b.key});

	return equal!("a.key == b.key && a.value == b.value")(lhs_pairs, rhs_pairs);
}

immutable int allTestsEnabled = 0;

// has_no_nucleotides
{
	const Counter dna = new Counter("");
	const ulong[char] expected = ['A': 0, 'T': 0, 'C': 0, 'G':0];

	auto actual = dna.nucleotideCounts();

	assert(aaEqual(expected, actual));
}

static if (allTestsEnabled)
{
// has_no_adenosine
{
	const Counter dna = new Counter("");

	assert(dna.countOne('A') == 0);
}

// repetitive_cytidine_gets_count
{
	const Counter dna = new Counter("CCCCC");

	assert(dna.countOne('C') == 5);
}

// repetitive_sequence_has_only_guanosine
{
	const Counter dna = new Counter("GGGGGGGG");
	const ulong[char] expected = ['A': 0, 'T': 0, 'C': 0, 'G': 8];

	const auto actual = dna.nucleotideCounts();

	assert(aaEqual(expected, actual));
}

// count_only_thymidine
{
	const Counter dna = new Counter("GGGGTAACCCGG");

	assert(dna.countOne('T') == 1);
}

// count_a_nucleotide_only_once
{

	const Counter dna = new Counter("GGTTGG");

	dna.countOne('T');

	assert(dna.countOne('T') == 2);
}

// validates_nucleotides
{
	import std.exception : assertThrown;

	const Counter dna = new Counter("GGTTGG");

	assertThrown(dna.countOne('X'));
}

// count_all_nucleotides)
{
	const Counter dna = new Counter("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC");
	const ulong[char] expected = ['A': 20, 'T': 21, 'G': 17, 'C': 12 ];

	auto actual = dna.nucleotideCounts();

	assert(aaEqual(expected, actual));
}
}

}
