module isbn_verifier;

pure bool isValid(immutable string isbn)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Valid isbn
    assert(isValid("3-598-21508-8"));

    static if (allTestsEnabled)
    {
        // Invalid isbn check digit
        assert(!isValid("3-598-21508-9"));

        // Valid isbn with a check digit of 10
        assert(isValid("3-598-21507-X"));

        // Check digit is a character other than X
        assert(!isValid("3-598-21507-A"));

        // Invalid check digit in isbn is not treated as zero
        assert(!isValid("4-598-21507-B"));

        // Invalid character in isbn is not treated as zero
        assert(!isValid("3-598-P1581-X"));

        // X is only valid as a check digit
        assert(!isValid("3-598-2X507-9"));

        // Only one check digit is allowed
        assert(!isValid("3-598-21508-96"));

        // X is not substituted by the value 10
        assert(!isValid("3-598-2X507-5"));

        // Valid isbn without separating dashes
        assert(isValid("3598215088"));

        // Isbn without separating dashes and X as check digit
        assert(isValid("359821507X"));

        // Isbn without check digit and dashes
        assert(!isValid("359821507"));

        // Too long isbn and no dashes
        assert(!isValid("3598215078X"));

        // Too short isbn
        assert(!isValid("00"));

        // Isbn without check digit
        assert(!isValid("3-598-21507"));

        // Check digit of X should not be used for 0
        assert(!isValid("3-598-21515-X"));

        // Empty isbn
        assert(!isValid(""));

        // Input is 9 characters
        assert(!isValid("134456729"));

        // Invalid characters are not ignored after checking length
        assert(!isValid("3132P34035"));

        // Invalid characters are not ignored before checking length
        assert(!isValid("3598P215088"));

        // Input is too long but contains a valid isbn
        assert(!isValid("98245726788"));
    }
}
