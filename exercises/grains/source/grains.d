module grains;

unittest
{
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 0;

    // returns the number of grains on the square
    assert(square(1) == 1);

    static if (allTestsEnabled)
    {
        assert(square(2) == 2);
        assert(square(3) == 4);
        assert(square(4) == 8);
        assert(square(16) == 32_768);
        assert(square(32) == 2_147_483_648uL);
        assert(square(64) == 9_223_372_036_854_775_808uL);

        // square 0 raises an exception
        assertThrown(square(0));

        // negative square raises an exception
        assertThrown(square(-1));

        // square greater than 64 raises an exception
        assertThrown(square(65));

        // returns the total number of grains on the board
        assert(total() == 18_446_744_073_709_551_615uL);
    }
}
