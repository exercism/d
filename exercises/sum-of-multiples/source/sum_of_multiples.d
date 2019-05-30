module sum_of_multiples;

unittest
{
    immutable int allTestsEnabled = 0;

    // no multiples within limit
    assert(calculateSum([3, 5], 1) == 0);

    static if (allTestsEnabled)
    {
        // one factor has multiples within limit
        assert(calculateSum([3, 5], 4) == 3);

        // more than one multiple within limit
        assert(calculateSum([3], 7) == 9);

        // more than one factor with multiples within limit
        assert(calculateSum([3, 5], 10) == 23);

        // each multiple is only counted once
        assert(calculateSum([3, 5], 100) == 2318);

        // a much larger limit
        assert(calculateSum([3, 5], 1000) == 233168);

        // three factors
        assert(calculateSum([7, 13, 17], 20) == 51);

        // factors not relatively prime
        assert(calculateSum([4, 6], 15) == 30);

        // some pairs of factors relatively prime and some not
        assert(calculateSum([5, 6, 8], 150) == 4419);

        // one factor is a multiple of another
        assert(calculateSum([5, 25], 51) == 275);

        // much larger factors
        assert(calculateSum([43, 47], 10000) == 2203160);

        // all numbers are multiples of 1
        assert(calculateSum([1], 100) == 4950);

        // no factors means an empty sum
        assert(calculateSum([0], 10000) == 0);

        // the only multiple of 0 is 0
        assert(calculateSum([0], 1) == 0);

        // the factor 0 does not affect the sum of multiples of other factors
        assert(calculateSum([3, 0], 4) == 3);

        // solutions using include-exclude must extend to cardinality greater than 3
        assert(calculateSum([2, 3, 5, 7, 11], 10000) == 39614537);
    }
}
