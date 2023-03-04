# Introduction

There are many ways to solve Pangram.
One approach could use [bitwise operations][bitwise] with [`fold`][fold].
Another approach could use the [`all`][all] function with the [`find`][find] function.
Still another approach could use the [`filter`][filter], [`map`][map], [`setIntersection`][setintersection], and [`fold`][fold] functions.
And yet another approach could use the [`filter`][filter], [`sort`][sort], and [`uniq`][uniq] functions.

## General guidance

No matter which approach is used, it is considered best practice to mark the `is_pangram` function as [`@safe`][safe] (as well as any helper functions.)

## Approach: Bitwise operations with `fold`

```d
module pangram;

import std.algorithm : filter;
import std.algorithm.iteration : fold;
import std.ascii : isAlpha;
import std.uni : toLower;

@safe
bool isPangram(string text)
{
    uint letters = 0;
    return text.toLower
        .filter!isAlpha
        .fold!((a, b) => a | (1 << (b - 'a')))(letters) == 0b00000011_1111_1111_1111_1111_1111_1111;
}
```

For more information, check the [bitwise operations with `fold` approach][approach-bitwise-fold].

## Approach: `all` with `find`

```d
module pangram;

import std.algorithm.searching : all, find;
import std.range : empty;
import std.uni : toLower;

private immutable abc = "abcdefghijklmnopqrstuvwxyz";

@safe
bool isPangram(string text)
{
    auto textLowered = text.toLower;
    return abc.all!((ltr) => !textLowered.find(ltr).empty);
}
```

For more information, check the [`all` with `find` approach][approach-all-find].

## Approach: `filter` and `map` with `setIntersection` and `fold`

```d
module pangram;

import std.algorithm : filter, map;
import std.algorithm.iteration : fold;
import std.algorithm.setops : setIntersection;
import std.array : array;
import std.ascii : isAlpha;
import std.uni : toLower;

private immutable abc = "abcdefghijklmnopqrstuvwxyz";

@safe
bool isPangram(string text)
{
    return text.filter!isAlpha
        .map!toLower
        .setIntersection(abc)
        .fold!((a, b) => a + 1)(1) == 26;
}
```

For more information, check the [`filter` and `map` with `setIntersection` and `fold` approach][approach-filter-map-setintersection-fold].

## Approach: `filter` and `sort` with `uniq`

```d
module pangram;

import std.algorithm : filter, sort;
import std.algorithm.iteration : uniq;
import std.array : array;
import std.ascii : isAlpha;
import std.uni : toLower;

@safe
bool isPangram(string text)
{
    return text.toLower.filter!isAlpha.array.sort.uniq.array.length == 26;
}
```

For more information, check the [`filter` and `sort` with `uniq` approach][approach-filter-sort-uniq].

## Which approach to use?

Since benchmarking is currrently outside the scope of this document, which to use is pretty much a matter of personal preference,
although the bitwise approach is likely most efficient.

[bitwise]: https://tour.dlang.org/tour/en/gems/bit-manipulation
[all]: https://dlang.org/phobos/std_algorithm_searching.html#all
[find]: https://dlang.org/phobos/std_algorithm_searching.html#find
[filter]: https://dlang.org/phobos/std_algorithm_iteration.html#.filter
[map]: https://dlang.org/phobos/std_algorithm_iteration.html#map
[setintersection]: https://dlang.org/phobos/std_algorithm_setops.html#setIntersection
[fold]: https://dlang.org/phobos/std_algorithm_iteration.html#fold
[sort]: https://dlang.org/phobos/std_algorithm_sorting.html#sort
[uniq]: https://dlang.org/phobos/std_algorithm_iteration.html#uniq
[safe]: https://dlang.org/spec/function.html#function-safety
[approach-bitwise-fold]: https://exercism.org/tracks/d/exercises/pangram/approaches/bitwise-fold
[approach-all-find]: https://exercism.org/tracks/d/exercises/pangram/approaches/all-find
[approach-filter-map-setintersection-fold]: https://exercism.org/tracks/d/exercises/pangram/approaches/filter-map-setintersection-fold
[approach-filter-sort-uniq]: https://exercism.org/tracks/d/exercises/pangram/approaches/filter-sort-uniq
