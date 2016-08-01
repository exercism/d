
module dna;

import std.stdio;
import std.string;
import std.array;
import std.algorithm.sorting: sort;
import std.algorithm.comparison: equal;

unittest
{

// test associative array equality
bool aa_equal (const int[char] lhs, const int[char] rhs)
{
	auto lhs_pairs = lhs.byKeyValue.array;
	auto rhs_pairs = rhs.byKeyValue.array;
	lhs_pairs.sort!(q{a.key < b.key});
	rhs_pairs.sort!(q{a.key < b.key});

	return equal!("a.key == b.key && a.value == b.value")(lhs_pairs, rhs_pairs);
}

immutable int all_tests_enabled = 0;

// has_no_nucleotides
{
	const counter dna = new counter("");
	const ulong[char] expected = ['A': 0, 'T': 0, 'C': 0, 'G':0];

	auto actual = dna.nucleotide_counts();

	assert(aa_equal(expected, actual));
}

static if (all_tests_enabled)
{
// has_no_adenosine
{
	const counter dna = new counter("");

	assert(dna.count_one('A') == 0);
}

// repetitive_cytidine_gets_count
{
	const counter dna = new counter("CCCCC");

	assert(dna.count_one('C') == 5);
}

// repetitive_sequence_has_only_guanosine
{
	const counter dna = new counter("GGGGGGGG");
	const ulong[char] expected = ['A': 0, 'T': 0, 'C': 0, 'G': 8];

	const auto actual = dna.nucleotide_counts();

	assert(aa_equal(expected, actual));
}

// count_only_thymidine
{
	const counter dna = new counter("GGGGTAACCCGG");

	assert(dna.count_one('T') == 1);
}

// count_a_nucleotide_only_once
{

	const counter dna = new counter("GGTTGG");

	dna.count_one('T');

	assert(dna.count_one('T') == 2);
}

// validates_nucleotides
{
	const counter dna = new counter("GGTTGG");

	assertThrown(dna.count_one('X'));
}

// count_all_nucleotides)
{
	const counter dna = new counter("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC");
	const ulong[char] expected = ['A': 20, 'T': 21, 'G': 17, 'C': 12 ];

	auto actual = dna.nucleotide_counts();

	assert(aa_equal(expected, actual));
}
}

}

void main ()
{
}

