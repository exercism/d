module isogram;

import std.algorithm : count, uniq;
import std.algorithm.iteration : filter;
import std.algorithm.sorting : sort;
import std.ascii : isAlpha;
import std.string : toLower;
import std.utf : byCodeUnit;

pure bool isIsogram(immutable string phrase)
{
    char[] phraseArray = phrase.toLower.dup;
    auto clean = sort(phraseArray.byCodeUnit).filter!(isAlpha);
    return clean.count == clean.uniq.count;
}

unittest
{
    assert(isIsogram(""));
    assert(isIsogram("isogram"));
    assert(!isIsogram("eleven"));
    assert(!isIsogram("zzyzx"));
    assert(isIsogram("subdermatoglyphic"));
    assert(!isIsogram("Alphabet"));
    assert(!isIsogram("alphAbet"));
    assert(isIsogram("thumbscrew-japingly"));
    assert(!isIsogram("thumbscrew-jappingly"));
    assert(isIsogram("six-year-old"));
    assert(isIsogram("Emily Jung Schwartzkopf"));
    assert(!isIsogram("accentor"));
    assert(!isIsogram("angola"));
}
