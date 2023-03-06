# Introduction

There are many ways to solve Pangram.
One approach could use [bitwise operations][bitwise] with [`filter`][filter] and [`fold`][fold].
Another approach could use the [`all`][all] function with the [`find`][find] function.
Still another approach could use the [`filter`][filter] and [`sort`][sort] with the [`uniq`][uniq] and [`count`][count] functions.

## General guidance

No matter which approach is used, it is considered best practice to mark the `isPangram` function as
[`@safe`][safe] and [`pure`][pure] (as well as any helper functions.)

All of these approach examples use the Unicode version of lowercasing an entire string ([`std.uni.toLower`][uni-toLower]`)
and then filter for ASCII alphabetic characters, like so:

```d
text.toLower
    .filter!isAlpha
```

Another way could `filter` first and then use the ASCII version of lowercasing ([`std.ascii.toLower`][ascii-toLower]`), which only works on one character at a time,
so it would need to be called something like this:

```d
text.filter!isAlpha
    .map!toLower
```

Although to `filter` and then `map!toLower` may be more efficient,
the approaches lowercase without using [`map`][map] and then `filter` to simplify the explanations a bit.

## Approach: Bitwise operations with `filter` and `fold`

```d
module pangram;

import std.algorithm : filter;
import std.algorithm.iteration : fold;
import std.ascii : isAlpha;
import std.uni : toLower;

@safe pure bool isPangram(string text)
{
    uint letters = 0;
    return text.toLower
        .filter!isAlpha
        .fold!((a, b) => a | (1 << (b - 'a')))(letters) == 0b00000011_1111_1111_1111_1111_1111_1111;
}
```

For more information, check the [bitwise operations with `filter` and `fold` approach][approach-bitwise-filter-fold].

## Approach: `all` with `find`

```d
module pangram;

import std.algorithm.searching : all, find;
import std.range : empty;
import std.uni : toLower;

private immutable abc = "abcdefghijklmnopqrstuvwxyz";

@safe pure bool isPangram(string text)
{
    auto textLowered = text.toLower;
    return abc.all!((ltr) => !textLowered.find(ltr).empty);
}
```

For more information, check the [`all` with `find` approach][approach-all-find].

## Approach: `filter` and `sort` with `uniq` and `count`

```d
module pangram;

import std.algorithm : filter, map, sort;
import std.algorithm.iteration : uniq;
import std.algorithm.searching : count;
import std.array : array;
import std.ascii : isAlpha, toLower;

private immutable abc = "abcdefghijklmnopqrstuvwxyz";

@safe
pure bool isPangram(string text)
{
    return text.filter!isAlpha
        .map!toLower
        .array
        .sort
        .uniq
        .count == 26;
}
```

For more information, check the [`filter` and `sort` with `uniq` and `count` approach][approach-filter-sort-uniq-count].

## Which approach to use?

Since benchmarking is currrently outside the scope of this document, which to use is pretty much a matter of personal preference,
although the bitwise approach is likely most efficient.

[bitwise]: https://tour.dlang.org/tour/en/gems/bit-manipulation
[all]: https://dlang.org/phobos/std_algorithm_searching.html#all
[find]: https://dlang.org/phobos/std_algorithm_searching.html#find
[filter]: https://dlang.org/phobos/std_algorithm_iteration.html#.filter
[map]: https://dlang.org/phobos/std_algorithm_iteration.html#map
[fold]: https://dlang.org/phobos/std_algorithm_iteration.html#fold
[count]: https://dlang.org/phobos/std_algorithm_searching.html#count
[sort]: https://dlang.org/phobos/std_algorithm_sorting.html#sort
[uniq]: https://dlang.org/phobos/std_algorithm_iteration.html#uniq
[safe]: https://dlang.org/spec/function.html#function-safety
[pure]: https://dlang.org/spec/function.html#pure-functions
[uni-tolower]: https://dlang.org/library/std/uni/to_lower.html
[ascii-tolower]: https://dlang.org/library/std/ascii/to_lower.html
[approach-bitwise-filter-fold]: https://exercism.org/tracks/d/exercises/pangram/approaches/bitwise-filter-fold
[approach-all-find]: https://exercism.org/tracks/d/exercises/pangram/approaches/all-find
[approach-filter-sort-uniq-count]: https://exercism.org/tracks/d/exercises/pangram/approaches/filter-sort-uniq-count
