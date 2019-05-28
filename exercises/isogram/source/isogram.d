module isogram;

unittest
{
    immutable int allTestsEnabled = 0;

    // empty string
    assert(isIsogram(""));

    static if (allTestsEnabled)
    {
        // isogram with only lower case characters
        assert(isIsogram("isogram"));

        // word with one duplicated character
        assert(!isIsogram("eleven"));

        // word with one duplicated character from the end of the alphabet
        assert(!isIsogram("zzyzx"));

        // longest reported english isogram
        assert(isIsogram("subdermatoglyphic"));

        // word with duplicated character in mixed case
        assert(!isIsogram("Alphabet"));

        // word with duplicated character in mixed case, lowercase first
        assert(!isIsogram("alphAbet"));

        // hypothetical isogrammic word with hyphen
        assert(isIsogram("thumbscrew-japingly"));

        // hypothetical word with duplicated character following hyphen
        assert(!isIsogram("thumbscrew-jappingly"));

        // isogram with duplicated hyphen
        assert(isIsogram("six-year-old"));

        // made-up name that is an isogram
        assert(isIsogram("Emily Jung Schwartzkopf"));

        // duplicated character in the middle
        assert(!isIsogram("accentor"));

        // same first and last characters
        assert(!isIsogram("angola"));
    }
}
