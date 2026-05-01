module acronym;

import std.algorithm : map;
import std.array : array;
import std.regex : regex, matchAll;
import std.string : replace, toUpper;

immutable r = regex(`[A-Z]+`);

string abbreviate(immutable string phrase)
{
    return matchAll(phrase.replace("'", "").toUpper, r)
        .map!(m => m.hit[0])
        .array;
}
