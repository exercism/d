module collatz_conjecture;

pure int steps(immutable int number)
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
