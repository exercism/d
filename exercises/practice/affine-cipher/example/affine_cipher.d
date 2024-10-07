module affine_cipher;

import std.ascii : isAlphaNum, isDigit, toLower;

pure string encode(immutable string phrase, uint a, uint b)
{
    if (!inverses[a])
    {
        throw new Exception("a and m must be coprime.");
    }

    return process(phrase, a, b, 5);
}

pure string decode(immutable string phrase, uint a, uint b)
{
    uint inverse = inverses[a];
    if (!inverse)
    {
        throw new Exception("a and m must be coprime.");
    }

    return process(phrase, inverse, inverse * (26 - (b % 26)), uint.max);
}

pure string process(immutable string phrase, uint a, uint b,  uint chunk)
{
    size_t nextSpace = chunk;
    string result;
    foreach (dchar c; phrase) {
        if (!isAlphaNum(c)) {
            continue;
        }
        if (result.length == nextSpace) {
            result ~= ' ';
            nextSpace += chunk + 1;
        }
        if (!isDigit(c)) {
            c = 'a' + ((toLower(c) - 'a') * a + b) % 26;
        }
        result ~= c;
    }
    return result;
}

private immutable uint[] inverses = [
    0,
    1,
    0,
    9,
    0,
    21,
    0,
    15,
    0,
    3,
    0,
    19,
    0,
    0,
    0,
    7,
    0,
    23,
    0,
    11,
    0,
    5,
    0,
    17,
    0,
    25,
    0
];

unittest
{
    import std.algorithm.comparison : equal;
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 0;

    // Encode-encode yes
    assert(equal("xbt", encode("yes", 5, 7)));

    static if (allTestsEnabled)
    {
        // Encode-encode no
        assert(equal("fu", encode("no", 15, 18)));

        // Encode-encode OMG
        assert(equal("lvz", encode("OMG", 21, 3)));

        // Encode-encode O M G
        assert(equal("hjp", encode("O M G", 25, 47)));

        // Encode-encode mindblowingly
        assert(equal("rzcwa gnxzc dgt", encode("mindblowingly", 11, 15)));

        // Encode-encode numbers
        assert(equal("jqgjc rw123 jqgjc rw", encode("Testing,1 2 3, testing.", 3, 4)));

        // Encode-encode deep thought
        assert(equal("iynia fdqfb ifje", encode("Truth is fiction.", 5, 17)));

        // Encode-encode all the letters
        assert(equal("swxtj npvyk lruol iejdc blaxk swxmh qzglf", encode("The quick brown fox jumps over the lazy dog.", 17, 33)));

        // Encode-encode with a not coprime to m
        assertThrown(encode("This is a test.", 6, 17));

        // Decode-decode exercism
        assert(equal("exercism", decode("tytgn fjr", 3, 7)));

        // Decode-decode a sentence
        assert(equal("anobstacleisoftenasteppingstone", decode("qdwju nqcro muwhn odqun oppmd aunwd o", 19, 16)));

        // Decode-decode numbers
        assert(equal("testing123testing", decode("odpoz ub123 odpoz ub", 25, 7)));

        // Decode-decode all the letters
        assert(equal("thequickbrownfoxjumpsoverthelazydog", decode("swxtj npvyk lruol iejdc blaxk swxmh qzglf", 17, 33)));

        // Decode-decode with no spaces in input
        assert(equal("thequickbrownfoxjumpsoverthelazydog", decode("swxtjnpvyklruoliejdcblaxkswxmhqzglf", 17, 33)));

        // Decode-decode with too many spaces
        assert(equal("jollygreengiant", decode("vszzm    cly   yd cg    qdp", 15, 16)));

        // Decode-decode with a not coprime to m
        assertThrown(decode("Test", 13, 5));
    }
}
