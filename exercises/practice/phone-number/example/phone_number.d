module phone_number;

import std.ascii : isAlpha, isDigit;
import std.string : indexOf;

private immutable string punctuation = " ()+-.";

pure string clean(immutable string phrase)
{
    string digits;
    foreach(c; phrase)
    {
        if (isDigit(c))
        {
            digits ~= c;
        }
        else if (isAlpha(c))
        {
            throw new Exception("letters not permitted");
        }
        else if (punctuation.indexOf(c) == -1)
        {
            throw new Exception("punctuations not permitted");
        }
    }

    if (digits.length < 10)
    {
        throw new Exception("must not be fewer than 10 digits");
    }
    if (digits.length == 11)
    {
        if (digits[0] != '1')
        {
            throw new Exception("11 digits must start with 1");
        }
        digits = digits[1..digits.length];
    }
    if (digits.length > 11)
    {
        throw new Exception("must not be greater than 11 digits");
    }

    if (digits[0] == '0')
    {
        throw new Exception("area code cannot start with zero");
    }
    if (digits[0] == '1')
    {
        throw new Exception("area code cannot start with one");
    }

    if (digits[3] == '0')
    {
        throw new Exception("exchange code cannot start with zero");
    }
    if (digits[3] == '1')
    {
        throw new Exception("exchange code cannot start with one");
    }

    return digits;
}
