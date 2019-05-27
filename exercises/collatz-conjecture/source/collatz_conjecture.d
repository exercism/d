module collatz_conjecture;

unittest
{
    import std.exception : assertThrown;

    const int allTestsEnabled = 0;

    // zero steps for one
    assert(steps(1) == 0);

    static if (allTestsEnabled)
    {
        // divide if even
        assert(steps(16) == 4);

        // even and odd steps
        assert(steps(12) == 9);

        // large number of even and odd steps
        assert(steps(1000000) == 152);

        // zero is an error
        assertThrown(steps(0));

        // negative value is an error
        assertThrown(steps(-15));
    }
}
