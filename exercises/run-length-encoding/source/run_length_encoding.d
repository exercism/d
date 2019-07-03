module run_length_encoding;

unittest
{
    immutable int allTestsEnabled = 0;

    // run-length encode a string

    // empty string
    assert(encode("") == "");

    static if (allTestsEnabled)
    {
        // single characters only are encoded without count
        assert(encode("XYZ") == "XYZ");

        // string with no single characters
        assert(encode("AABBBCCCC") == "2A3B4C");

        // single characters mixed with repeated characters
        assert(encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB") == "12WB12W3B24WB");

        // multiple whitespace mixed in string
        assert(encode("  hsqq qww  ") == "2 hs2q q2w2 ");

        // lowercase characters
        assert(encode("aabbbcccc") == "2a3b4c");

        // run-length decode a string

        // empty string
        assert(decode("") == "");

        // string with no single characters
        assert(decode("XYZ") == "XYZ");

        // single characters with repeated characters
        assert(decode("2A3B4C") == "AABBBCCCC");

        // multiple whitespace mixed in string
        assert(decode("12WB12W3B24WB") == "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB");

        // multiple whitespace mixed in string
        assert(decode("2 hs2q q2w2 ") == "  hsqq qww  ");

        // lower case string
        assert(decode("2a3b4c") == "aabbbcccc");

        // encode and then decode

        // encode followed by decode gives original string
        assert("zzz ZZ  zZ".encode.decode == "zzz ZZ  zZ");
    }
}
