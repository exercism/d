module luhn;

pure bool valid(immutable string input)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Single digit strings can not be valid
    assert(!valid("1"));

    static if (allTestsEnabled)
    {
        // A single zero is invalid
        assert(!valid("0"));

        // A simple valid SIN that remains valid if reversed
        assert(valid("059"));

        // A simple valid SIN that becomes invalid if reversed
        assert(valid("59"));

        // A valid Canadian SIN
        assert(valid("055 444 285"));

        // Invalid Canadian SIN
        assert(!valid("055 444 286"));

        // Invalid credit card
        assert(!valid("8273 1232 7352 0569"));

        // Invalid long number with an even remainder
        assert(!valid("1 2345 6789 1234 5678 9012"));

        // Invalid long number with a remainder divisible by 5
        assert(!valid("1 2345 6789 1234 5678 9013"));

        // Valid number with an even number of digits
        assert(valid("095 245 88"));

        // Valid number with an odd number of spaces
        assert(valid("234 567 891 234"));

        // Valid strings with a non-digit added at the end become invalid
        assert(!valid("059a"));

        // Valid strings with punctuation included become invalid
        assert(!valid("055-444-285"));

        // Valid strings with symbols included become invalid
        assert(!valid("055# 444$ 285"));

        // Single zero with space is invalid
        assert(!valid(" 0"));

        // More than a single zero is valid
        assert(valid("0000 0"));

        // Input digit 9 is correctly converted to output digit 9
        assert(valid("091"));

        // Very long input is valid
        assert(valid("9999999999 9999999999 9999999999 9999999999"));

        // Valid luhn with an odd number of digits and non zero first digit
        assert(valid("109"));

        // Using ascii value for non-doubled non-digit isn't allowed
        assert(!valid("055b 444 285"));

        // Using ascii value for doubled non-digit isn't allowed
        assert(!valid(":9"));

        // Non-numeric, non-space char in the middle with a sum that's divisible by 10 isn't allowed
        assert(!valid("59%59"));
    }
}
