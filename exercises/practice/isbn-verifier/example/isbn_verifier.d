module isbn_verifier;

import std.ascii : isDigit;

pure bool isValid(immutable string isbn)
{
    auto total = 0;
    auto weightedTotal = 0;
    auto remainingDigits = 10;

    foreach (c; isbn) {
        if (c == '-')
        {
            continue;
        }

        --remainingDigits;

        if (isDigit(c))
        {
            total += c - '0';
        }
        else if (remainingDigits == 0 && c == 'X')
        {
            total += 10;
        }
        else
        {
            return false;
        }

        weightedTotal += total;
    }

    return remainingDigits == 0 && weightedTotal % 11 == 0;
}
