module phone_number;

pure string clean(immutable string phrase)
{
    // implement this function
}

unittest
{
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 0;

    // Cleans the number
    assert(clean("(223) 456-7890") == "2234567890");

    static if (allTestsEnabled)
    {
        // Cleans numbers with dots
        assert(clean("223.456.7890") == "2234567890");

        // Cleans numbers with multiple spaces
        assert(clean("223 456   7890   ") == "2234567890");

        // Invalid when 9 digits
        assertThrown(clean("123456789"));

        // Invalid when 11 digits does not start with a 1
        assertThrown(clean("22234567890"));

        // Valid when 11 digits and starting with 1
        assert(clean("12234567890") == "2234567890");

        // Valid when 11 digits and starting with 1 even with punctuation
        assert(clean("+1 (223) 456-7890") == "2234567890");

        // Invalid when more than 11 digits
        assertThrown(clean("321234567890"));

        // Invalid with letters
        assertThrown(clean("523-abc-7890"));

        // Invalid with punctuations
        assertThrown(clean("523-@:!-7890"));

        // Invalid if area code starts with 0
        assertThrown(clean("(023) 456-7890"));

        // Invalid if area code starts with 1
        assertThrown(clean("(123) 456-7890"));

        // Invalid if exchange code starts with 0
        assertThrown(clean("(223) 056-7890"));

        // Invalid if exchange code starts with 1
        assertThrown(clean("(223) 156-7890"));

        // Invalid if area code starts with 0 on valid 11-digit number
        assertThrown(clean("1 (023) 456-7890"));

        // Invalid if area code starts with 1 on valid 11-digit number
        assertThrown(clean("1 (123) 456-7890"));

        // Invalid if exchange code starts with 0 on valid 11-digit number
        assertThrown(clean("1 (223) 056-7890"));

        // Invalid if exchange code starts with 1 on valid 11-digit number
        assertThrown(clean("1 (223) 156-7890"));
    }
}
