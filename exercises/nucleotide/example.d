
module nucleotide;

import std.stdio;
import std.string;
import std.algorithm.comparison : equal;
import std.algorithm.sorting : sort;
import std.algorithm.searching : count;
import std.algorithm.iteration : each;
import std.typecons;
import std.array : array;
import std.exception;


class counter
{
public:

	this (string chain)
	{
		this.dna_chain = chain;
	}

	this (const ref string chain)
	{
		this.dna_chain = chain;
		cached_counts['A'] = count_one('A');
		cached_counts['C'] = count_one('C');
		cached_counts['G'] = count_one('G');
		cached_counts['T'] = count_one('T');
	}

	final const ref int[char] nucleotide_count_ones () const
	{
		int[char] nuc_count_ones = ['A': 0, 'C': 0, 'G': 0, 'T': 0];

		if (strip(dna_chain).length == 0) return nuc_count_ones;

		nuc_count_ones['A'] = count_one('A');
		nuc_count_ones['C'] = count_one('C');
		nuc_count_ones['G'] = count_one('G');
		nuc_count_ones['T'] = count_one('T');

		return nuc_count_ones;
	}

	final int count_one (const char c) const
	{
		char[] nucleotides = ['A', 'C', 'G', 'T'];
		if (c != nucleotides[0] && c != nucleotides[1] && c != nucleotides[2] && c!= nucleotides[3])
		{
			throw new Exception("Nucleotide invalid symbol.");
		}

		if (!cached_count_ones[c].cached)
		{
			cached_count_ones[c].count_one = count!(dna_chain, c);
			cached_count_ones[c].cached = true;
		}

		return cached_count_ones[c].count_one;
	}

private:
	const string dna_chain;
	const int [char] cached_counts;
}

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
	const int[char] expected = ['A': 0, 'T': 0, 'C': 0, 'G':0];

	const auto actual = dna.nucleotide_counts();

	assert(aa_equal(expected, actual));
}

// has_no_adenosine
{
	const counter dna = new counter("");

	assert(dna.count_one('A') == 0);
}

//repetitive_cytidine_gets_count_ones)
{
	const counter dna = new counter("CCCCC");

	assert(dna.count_one('C') == 5);
}

static if (all_tests_enabled)
{
//repetitive_sequence_has_only_guanosine)
{
	const counter dna = new counter("GGGGGGGG");
	const int[char] expected = ['A': 0, 'T': 0, 'C': 0, 'G': 8];

	const auto actual = dna.nucleotide_counts();

	assert(aa_equal(expected, actual));
}

//count_ones_only_thymidine)
{
	const counter dna = new counter("GGGGTAACCCGG");

	assert(dna.count_one('T') == 1);
}

//count_ones_a_nucleotide_only_once)
{

	const counter dna = new counter("GGTTGG");

	dna.count_one('T');

	assert(dna.count_one('T') == 2);
}

//validates_nucleotides)
{
	const counter dna = new counter("GGTTGG");

	assertThrown(dna.count_one('X'));
}

//count_ones_all_nucleotides)
{
	const counter dna = new counter("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC");
	const int[char] expected = ['A': 20, 'T': 21, 'G': 17, 'C': 12 ];

	auto actual = dna.nucleotide_counts();

	assert(aa_equal(expected, actual));
}

}

}

void main ()
{
}

