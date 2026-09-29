module run_length_encoding;

pure string encode(immutable string input)
{
    // implement this function
}

pure string decode(immutable string input)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Empty string
    assert(encode("") == "");

    static if (allTestsEnabled)
    {
        // Single characters only are encoded without count
        assert(encode("XYZ") == "XYZ");

        // String with no single characters
        assert(encode("AABBBCCCC") == "2A3B4C");

        // Single characters mixed with repeated characters
        assert(encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB") == "12WB12W3B24WB");

        // Multiple whitespace mixed in string
        assert(encode("  hsqq qww  ") == "2 hs2q q2w2 ");

        // Lowercase characters
        assert(encode("aabbbcccc") == "2a3b4c");

        // Empty string
        assert(decode("") == "");

        // Single characters only
        assert(decode("XYZ") == "XYZ");

        // String with no single characters
        assert(decode("2A3B4C") == "AABBBCCCC");

        // Single characters with repeated characters
        assert(decode("12WB12W3B24WB") == "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB");

        // Multiple whitespace mixed in string
        assert(decode("2 hs2q q2w2 ") == "  hsqq qww  ");

        // Lowercase string
        assert(decode("2a3b4c") == "aabbbcccc");

        // Encode followed by decode gives original string
        assert("zzz ZZ  zZ".encode.decode == "zzz ZZ  zZ");
    }
}
