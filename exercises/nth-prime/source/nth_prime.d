module nth_prime;

unittest
{
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 0;

    // first prime
    assert(prime(1) == 2);

    static if (allTestsEnabled)
    {
        // second prime
        assert(prime(2) == 3);

        // sixth prime
        assert(prime(6) == 13);

        // big prime
        assert(prime(10_001) == 10_4743);

        // there is no zeroth prime
        assertThrown(prime(0));
    }

}
