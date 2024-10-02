module nth_prime;

pure int prime(immutable int number)
{
    // implement this function
}

unittest
{
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 0;

    // First prime
    assert(prime(1) == 2);

    static if (allTestsEnabled)
    {
        // Second prime
        assert(prime(2) == 3);

        // Sixth prime
        assert(prime(6) == 13);

        // Big prime
        assert(prime(10_001) == 10_4743);

        // There is no zeroth prime
        assertThrown(prime(0));
    }

}
