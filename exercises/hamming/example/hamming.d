
module hamming;


import std.string;
import std.algorithm.comparison : mismatch;

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

    return count;
}
