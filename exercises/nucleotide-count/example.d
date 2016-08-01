
module nucleotide;

import std.stdio;
import std.string;
import std.algorithm.comparison : equal;
import std.algorithm.sorting : sort;
import std.algorithm.iteration : each;
import std.algorithm.searching : count;
import std.typecons;
import std.array : array;
import std.exception;


class counter
{
public:

	this (string chain)
	{
		this.dna_chain = chain;
		cached_counts = init_counts(chain);
	}

	this (const ref string chain)
	{
		this.dna_chain = chain;
		cached_counts = init_counts(chain);
	}

	final const(ulong[char]) nucleotide_counts () const
	{
		return cached_counts;
	}

	final ulong count_one (const char c) const
	{
		char[] nucleotides = ['A', 'C', 'G', 'T'];
		if (c != nucleotides[0] && c != nucleotides[1] && c != nucleotides[2] && c!= nucleotides[3])
		{
			throw new Exception("Nucleotide invalid symbol.");
		}

		return cached_counts[c];
	}

private:

	ulong[char] init_counts (const ref string chain)
	{
		ulong[char] counts = ['A': 0, 'C': 0, 'G': 0, 'T': 0];

		if (strip(chain).length == 0) return counts;

		counts['A'] = count(chain.representation, 'A');
		counts['C'] = count(chain.representation, 'C');
		counts['G'] = count(chain.representation, 'G');
		counts['T'] = count(chain.representation, 'T');

		return counts;
	}

	const string dna_chain;
	ulong[char] cached_counts;
}

unittest
{

// test associative array equality
bool aa_equal (const ulong[char] lhs, const ulong[char] rhs)
{
	auto lhs_pairs = lhs.byKeyValue.array;
	auto rhs_pairs = rhs.byKeyValue.array;
	lhs_pairs.sort!(q{a.key < b.key});
	rhs_pairs.sort!(q{a.key < b.key});

	return equal!("a.key == b.key && a.value == b.value")(lhs_pairs, rhs_pairs);
}

// has_no_nucleotides
{
	const counter dna = new counter("");
	const ulong[char] expected = ['A': 0, 'T': 0, 'C': 0, 'G':0];

	auto actual = dna.nucleotide_counts();

	assert(aa_equal(expected, actual));
}

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

void main ()
{
}

