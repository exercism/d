module grains;

pure ulong square(immutable ulong num)
{
    // implement this function
}

pure ulong total()
{
    // implement this function
}

unittest
{
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 0;

    // Returns the number of grains on the square - grains on square 1
    assert(square(1) == 1);

    static if (allTestsEnabled)
    {
        // Returns the number of grains on the square - grains on square 2
        assert(square(2) == 2);

        // Returns the number of grains on the square - grains on square 3
        assert(square(3) == 4);

        // Returns the number of grains on the square - grains on square 4
        assert(square(4) == 8);

        // Returns the number of grains on the square - grains on square 16
        assert(square(16) == 32_768);

        // Returns the number of grains on the square - grains on square 32
        assert(square(32) == 2_147_483_648);

        // Returns the number of grains on the square - grains on square 64
        assert(square(64) == 9_223_372_036_854_775_808);

        // Square 0 raises an exception
        assertThrown(square(0));

        // Negative square raises an exception
        assertThrown(square(-1));

        // Square greater than 64 raises an exception
        assertThrown(square(65));

        // Returns the total number of grains on the board
        assert(total() == 18_446_744_073_709_551_615);
    }
}
