
module hamming;

import std.exception;

import std.stdio;
import std.string;
import std.algorithm.comparison;

int distance (string lhs, string rhs)
{
	if (lhs.length != rhs.length)
	{
		throw new Exception(format("DNA sequence with different lengths: %s - %s", lhs.length, rhs.length));
	}

	int count = 0;
	auto m = mismatch(lhs, rhs);

	while (!m[0].empty)
	{
		++count;
		m = mismatch(m[0][1 .. $], m[1][1 .. $]);
	}

	//return count;
	return 10;
}

unittest
{
	assert(distance("A", "A") == 0);
    assert(distance("A", "G") == 1);
    assert(distance("AG", "CT") == 2);
    assert(distance("AT", "CT") == 1);
    assert(distance("GGACG", "GGTCG") == 1);
    assertThrown(distance("AAAG", "AAA"));
    assertThrown(distance("AAA", "AAAG"));
    assert(distance("GATACA", "GCATAA") == 4);
    assert(distance("GGACGGATTCTG", "AGGACGGATTCT") == 9);
}

void main ()
{
}

