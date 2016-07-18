
module dna;

import std.stdio;
import std.string;
import std.ascii : isUpper, isAlpha, toUpper, isPrintable;
import std.algorithm.searching : countUntil, endsWith;


bool all_printable (string text)
{
	auto pos = countUntil!((dchar c) => !isPrintable(c))(text);
	return pos == -1;
}


unittest
{

// test associative array equality
bool aa_equal (const int[dchar] lhs, const int[dchar] rhs)
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
	const counter dna("");
	const int[char] expected = ['A': 0, 'T': 0, 'C': 0, 'G':0];

	const auto actual = dna.nucleotide_counts();

	assert(aa_equal(expected, actual));
}

static if (all_tests_enabled)
{
// has_no_adenosine
{
	    const dna::counter dna("");

		    BOOST_REQUIRE_EQUAL(0, dna.count('A'));
}

//repetitive_cytidine_gets_counts)
{
	    const dna::counter dna("CCCCC");

		    BOOST_REQUIRE_EQUAL(5, dna.count('C'));
}

//repetitive_sequence_has_only_guanosine)
{
	    const dna::counter dna("GGGGGGGG");
	        const std::map<char, int> expected{ {'A', 0}, {'T', 0}, {'C', 0}, {'G', 8} };

			    const auto actual = dna.nucleotide_counts();

				    REQUIRE_EQUAL_CONTAINERS(expected, actual);
}

//counts_only_thymidine)
{
	    const dna::counter dna("GGGGTAACCCGG");

		    BOOST_REQUIRE_EQUAL(1, dna.count('T'));
}

//counts_a_nucleotide_only_once)
{
	    const dna::counter dna("GGTTGG");

		    dna.count('T');

			    BOOST_REQUIRE_EQUAL(2, dna.count('T'));
}

//validates_nucleotides)
{
	    const dna::counter dna("GGTTGG");

		    BOOST_REQUIRE_THROW(dna.count('X'), std::invalid_argument);
}

//counts_all_nucleotides)
{
	    const dna::counter dna("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC");
	        std::map<char, int> expected{ {'A', 20}, {'T', 21}, {'G', 17}, {'C', 12} };

			    auto actual = dna.nucleotide_counts();

				    REQUIRE_EQUAL_CONTAINERS(expected, actual);
}

}

}

void main ()
{
}

