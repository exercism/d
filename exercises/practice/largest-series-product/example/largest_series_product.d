module largest_series_product;

import std.ascii : isDigit;
import std.algorithm : max;
import std.algorithm.iteration : reduce;

pure ulong largestProduct(immutable string digits, int span)
{
    foreach(c; digits)
    {
        if (!isDigit(c))
        {
            throw new Exception("digits input must only contain digits");
        }
    }

    if (span < 0)
    {
        throw new Exception("span must not be negative");
    }

    if (span == 0)
    {
        return 1;
    }

    if (digits.length < span)
    {
        throw new Exception("span must be smaller than string length");
    }

    ulong result = 0;
    for (size_t begin = 0; begin + span <= digits.length; ++begin)
    {
        result = max(result, reduce!((product, c) => product * (c - '0'))
                                    (1uL, digits[begin..(begin + span)]));
    }
    return result;
}
