module bob;

import std.stdio;
import std.string;
import std.ascii : isUpper, isAlpha, toUpper, isPrintable;
import std.algorithm.searching : countUntil, endsWith;

pure bool allUpper(immutable string text)
{
    auto pos = countUntil!((dchar c) => toUpper(c) != c)(text);
    return pos == -1;
}

pure bool hasUpper(immutable string text)
{
    auto pos = countUntil!((dchar c) => isUpper(c))(text);
    return pos != -1;
}

pure bool allPrintable(immutable string text)
{
    auto pos = countUntil!((dchar c) => !isPrintable(c))(text);
    return pos == -1;
}

pure bool hasAlpha(immutable string text)
{
    auto pos = countUntil!((dchar c) => !isAlpha(c))(text);
    return pos == -1;
}

pure bool isShouting(immutable string text)
{
    if (!allUpper(text))
        return false;

    return hasUpper(text) && allPrintable(text);
}

pure bool isQuestion(immutable string text)
{
    return strip(text).endsWith!(a => a == '?');
}

pure bool isSilence(immutable string text)
{
    return strip(text).length == 0;
}

pure string hey(immutable string text)
{
    if (isSilence(text))
    {
        return "Fine. Be that way!";
    }
    else if (isShouting(text) && isQuestion(text))
    {
        return "Calm down, I know what I'm doing!";
    }
    else if (isShouting(text))
    {
        return "Whoa, chill out!";
    }
    else if (isQuestion(text))
    {
        return "Sure.";
    }

    return "Whatever.";
}
