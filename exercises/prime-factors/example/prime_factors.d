module prime_factors;

pure int[] factors(immutable long value)
{
    long n = value;
    int d = 2;
    int[] result;

    while (n > 1)
    {
        while (n % d == 0)
        {
            n = n / d;
            result ~= d;
        }
        d++;
    }

    return result;
}

unittest
{
    assert(factors(1) == []);
    assert(factors(2) == [2]);
    assert(factors(9) == [3, 3]);
    assert(factors(8) == [2, 2, 2]);
    assert(factors(12) == [2, 2, 3]);
    assert(factors(901_255) == [5, 17, 23, 461]);
    assert(factors(93_819_012_551) == [11, 9539, 894_119]);
}
