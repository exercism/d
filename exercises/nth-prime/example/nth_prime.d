module nth_prime;
import std.math : sqrt;
import std.conv;

pure int prime(immutable int number)
{
    if (number < 1)
    {
        throw new Exception("There is no zeroth prime");
    }

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
