module nucleotide_count;

import std.string;
import std.algorithm.comparison : equal;
import std.algorithm.sorting : sort;
import std.algorithm.searching : count;
import std.exception : enforce;
import std.regex;
import std.typecons;
import std.array : array;

enum nucleotideRegex = regex(r"^[CGTA]*$");

class Counter
{
public:

    this(string chain)
    {
        enforce(chain.matchFirst(nucleotideRegex), "Nucleotide invalid symbol.");
        this.dnaChain = chain;
        cachedCounts = initCounts(chain);
    }

    this(const ref string chain)
    {
        this.dnaChain = chain;
        cachedCounts = initCounts(chain);
    }

    final const(ulong[char]) nucleotideCounts() const
    {
        return cachedCounts;
    }

private:

    ulong[char] initCounts(const ref string chain)
    {
        ulong[char] counts = ['A' : 0, 'C' : 0, 'G' : 0, 'T' : 0];

        if (strip(chain).length == 0)
            return counts;

        counts['A'] = count(chain.representation, 'A');
        counts['C'] = count(chain.representation, 'C');
        counts['G'] = count(chain.representation, 'G');
        counts['T'] = count(chain.representation, 'T');

        return counts;
    }

    const string dnaChain;
    ulong[char] cachedCounts;
}
