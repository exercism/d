module etl;

import std.string;
import std.ascii : isUpper, isAlpha, toLower;
import std.algorithm.searching : countUntil;
import std.algorithm.iteration : each;
import std.algorithm.comparison : equal;
import std.algorithm.sorting : sort;
import std.typecons;
import std.array : array;

pure bool allAlphaUpper(immutable string text)
{
    auto pos = countUntil!((dchar c) => !(isAlpha(c) && isUpper(c)))(text);
    return pos == -1;
}

pure int[dchar] transform(immutable string[int] score_map)
{
    int[dchar] new_map;

    foreach (entry; score_map.byKeyValue())
    {
        if (!allAlphaUpper(entry.value))
        {
            throw new Exception(format("Invalid input %s", entry.value));
        }

        entry.value.each!((dchar c) => new_map[toLower(c)] = entry.key);
    }

    return new_map;
}
