module hamming;

import std.string;
import std.algorithm.comparison : mismatch;
import std.exception : enforce;

pure int distance(immutable string lhs, immutable string rhs)
{
    enforce(lhs.length == rhs.length, "left and right strands must be of equal length");

    int count = 0;
    auto m = mismatch(lhs, rhs);

    while (!m[0].empty)
    {
        ++count;
        m = mismatch(m[0][1 .. $], m[1][1 .. $]);
    }

    return count;
}
