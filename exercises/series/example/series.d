module series;

import std.algorithm : equal;
import std.ascii : isDigit;
import std.string;
import std.math : floor;
import std.conv : to;

ulong raisingProduct(ulong m, ulong n)
{
    if (n < 1)
        return 1;
    if (m > n)
        return 1;
    if (m < 1)
        m = 1;

    ulong result = m;
    m += 1;
    while (m <= n)
    {
        result *= m;
        m += 1;
    }

    return result;
}

ulong combinationsOfK(ulong n, ulong k)
{
    ulong top = raisingProduct(n - k + 1, n);
    ulong bottom = raisingProduct(1, k);

    return to!ulong(floor(to!float(top) / bottom));
}

ulong numOfConsecutiveSubarrays(ulong len, ulong stride)
{
    size_t i = 0;
    for (size_t j = stride; j <= len; ++j)
    {
        ++i;
    }

    return i;
}

int[] digits(string input)
{
    int[] result;
    foreach (c; input.representation)
    {
        if (!isDigit(c))
            throw new Exception("Invalid character(non-digit) in input string.");

        result ~= c - '0';
    }

    return result;
}

int[][] slice(string input, uint stride = 1)
{
    if (input.length < stride)
        throw new Exception("Stride is longer than input.");

    int[] dig = digits(input);

    ulong k = numOfConsecutiveSubarrays(dig.length, stride);
    int[][] result = new int[][](k, stride);

    for (
        {
            size_t i = 0; size_t j = stride; }
            j <= dig.length;)
            {
                result[i] = dig[i .. j];
                ++i;
                ++j;
            }

            return result;
        }
