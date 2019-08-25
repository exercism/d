
module bob;

import std.stdio;
import std.string;
import std.ascii : isUpper, isAlpha, toUpper, isPrintable;
import std.algorithm.searching : countUntil, endsWith;

bool allUpper (string text)
{
    auto pos = countUntil!((dchar c) => toUpper(c) != c)(text);
    return pos == -1;
}

bool hasUpper (string text)
{
    auto pos = countUntil!((dchar c) => isUpper(c))(text);
    return pos != -1;
}

bool allPrintable (string text)
{
    auto pos = countUntil!((dchar c) => !isPrintable(c))(text);
    return pos == -1;
}

bool hasAlpha (string text)
{
    auto pos = countUntil!((dchar c) => !isAlpha(c))(text);
    return pos == -1;
}

bool isShouting (string text)
{
    if (!allUpper(text)) return false;

    return hasUpper(text) && allPrintable(text);
}

bool isQuestion (string text)
{
    return strip(text).endsWith!(a => a == '?');
}

bool isSilence (string text)
{
    return strip(text).length == 0;
}

string hey (string text)
{
    if (isSilence(text))
    {
	return "Fine. Be that way!";
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
