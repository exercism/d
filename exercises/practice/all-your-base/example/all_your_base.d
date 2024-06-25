module all_your_base;

import std.algorithm.mutation : reverse;

pure int[] rebase(int inputBase, immutable int[] digits, int outputBase)
{
    if (inputBase < 2)
    {
        throw new Exception("input base must be >= 2");
    }
    if (outputBase < 2)
    {
        throw new Exception("output base must be >= 2");
    }

    int number = 0;
    foreach(digit; digits)
    {
        if (digit < 0 || digit >= inputBase)
        {
            throw new Exception("all digits must satisfy 0 <= d < input base");
        }
        number = number * inputBase + digit;
    }

    int [] result;
    do
    {
        result ~= number % outputBase;
        number /= outputBase;
    } while (number != 0);
    return result.reverse;
}
