module prime_factors;

unittest
{
    immutable bool allTestsEnabled = false;

    // no factors
    assert(factors(1) == []);

    static if (allTestsEnabled)
    {
        // prime number
        assert(factors(2) == [2]);

        // square of a prime
        assert(factors(9) == [3, 3]);

        // cube of a prime
        assert(factors(8) == [2, 2, 2]);

        // product of primes and non-primes
        assert(factors(12) == [2, 2, 3]);

        // product of primes
        assert(factors(901_255) == [5, 17, 23, 461]);

        // factors include a large prime
        assert(factors(93_819_012_551) == [11, 9539, 894_119]);
    }
}
