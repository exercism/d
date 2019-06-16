module luhn;

unittest
{
    immutable int allTestsEnabled = 0;

    // single digit strings can not be valid
    assert(!valid("1"));

    static if (allTestsEnabled)
    {
        // a single zero is invalid
        assert(!valid("0"));

        // a simple valid SIN that remains valid if reversed
        assert(valid("059"));

        // a simple valid SIN that becomes invalid if reversed
        assert(valid("59"));

        // a valid Canadian SIN
        assert(valid("055 444 285"));

        // invalid Canadian SIN
        assert(!valid("055 444 286"));

        // invalid credit card
        assert(!valid("8273 1232 7352 0569"));

        // valid number with an even number of digits
        assert(valid("095 245 88"));

        // valid number with an odd number of spaces
        assert(valid("234 567 891 234"));

        // valid strings with a non-digit added at the end become invalid
        assert(!valid("059a"));

        // valid strings with punctuation included become invalid
        assert(!valid("055-444-285"));

        // valid strings with symbols included become invalid
        assert(!valid("055# 444$ 285"));

        // single zero with space is invalid
        assert(!valid(" 0"));

        // more than a single zero is valid
        assert(valid("0000 0"));

        // input digit 9 is correctly converted to output digit 9
        assert(valid("091"));

        /*
        Convert non-digits to their ascii values and then offset them by 48 sometimes accidentally declare an invalid string to be valid. 
        This test is designed to avoid that solution.
        */

        // using ascii value for non-doubled non-digit isn't allowed
        assert(!valid("055b 444 285"));

        // using ascii value for doubled non-digit isn't allowed
        assert(!valid(":9"));
    }

}
