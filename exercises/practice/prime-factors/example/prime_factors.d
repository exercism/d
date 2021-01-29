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
