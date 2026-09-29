module perfect_numbers;

enum Classification
{
    DEFICIENT,
    PERFECT,
    ABUNDANT
}

pure Classification classify(immutable int input)
{
    // implement this function
}

unittest
{
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 0;

    // Smallest perfect number is classified correctly
    assert(classify(6) == Classification.PERFECT);

    static if (allTestsEnabled)
    {
        // Medium perfect number is classified correctly
        assert(classify(28) == Classification.PERFECT);

        // Large perfect number is classified correctly
        assert(classify(33_550_336) == Classification.PERFECT);

        // Smallest abundant number is classified correctly
        assert(classify(12) == Classification.ABUNDANT);

        // Medium abundant number is classified correctly
        assert(classify(30) == Classification.ABUNDANT);

        // Large abundant number is classified correctly
        assert(classify(33_550_335) == Classification.ABUNDANT);

        // Perfect square abundant number is classified correctly
        assert(classify(196) == Classification.ABUNDANT);

        // Smallest prime deficient number is classified correctly
        assert(classify(2) == Classification.DEFICIENT);

        // Smallest non-prime deficient number is classified correctly
        assert(classify(4) == Classification.DEFICIENT);

        // Medium deficient number is classified correctly
        assert(classify(32) == Classification.DEFICIENT);

        // Large deficient number is classified correctly
        assert(classify(33_550_337) == Classification.DEFICIENT);

        // Edge case (no factors other than itself) is classified correctly
        assert(classify(1) == Classification.DEFICIENT);

        // Zero is rejected (as it is not a positive integer)
        assertThrown(classify(0));

        // Negative integer is rejected (as it is not a positive integer)
        assertThrown(classify(-1));
    }
}
