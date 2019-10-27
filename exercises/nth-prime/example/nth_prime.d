module nth_prime;

import std.exception : enforce;
import std.math : sqrt;
import std.conv;

pure int prime(immutable int number)
{
    enforce(number > 0, "There is no zeroth prime");

    int primes = 0;
    int i = 1;

    while (primes < number)
    {
        i += 1;
        if (isPrime(i))
        {
            primes += 1;
        }
    }
    return i;
}

private pure bool isPrime(immutable int n)
{
    if (n == 1)
    {
        return false;
    }
    if (n == 2)
    {
        return true;
    }
    for (int i = 2; i <= sqrt(to!double(n)); i++)
    {
        if (n % i == 0)
        {
            return false;
        }
    }
    return true;
}
