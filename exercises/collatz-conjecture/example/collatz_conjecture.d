module collatz_conjecture;

int steps(int number)
{
    if (number < 1)
    {
        throw new Exception("Only positive numbers are allowed");
    }

    int result = 0;
    int n = number;

    while (n != 1)
    {
        if (n % 2 == 0)
        {
            n = (n / 2);
        }
        else
        {
            n = 3 * n + 1;
        }
        result++;
    }

    return result;
}

unittest
{
    import std.exception : assertThrown;

    assert(steps(1) == 0);
    assert(steps(16) == 4);
    assert(steps(12) == 9);
    assert(steps(1000000) == 152);
    assertThrown(steps(0));
    assertThrown(steps(-15));
}
