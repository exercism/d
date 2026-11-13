module crypto;

import std.algorithm.comparison : max;
import std.algorithm.iteration : filter, joiner, map;
import std.array : array;
import std.ascii : isAlphaNum, toLower;
import std.math : ceil, sqrt;
import std.range : chunks, padRight, transposed;

struct Cipher
{
    private immutable(dchar)[] normalized;

    this(string text)
    {
        normalized = text.filter!isAlphaNum.map!toLower.array;
    }

    auto cipherText() const
    {
        immutable columns = max(1, cast(size_t) ceil(sqrt(cast(double) normalized.length)));
        immutable rows = (normalized.length + columns - 1) / columns;
        return normalized.padRight(dchar(' '), rows * columns)
            .array
            .chunks(columns)
            .array
            .transposed
            .joiner(" ");
    }
}
