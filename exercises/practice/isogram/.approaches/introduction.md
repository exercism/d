# Introduction

There are several ways to solve Isogram.
One approach can use the [`filter`][filter] and [`map`][map] methods with [`foreach`][foreach].
Another approach could use the `filter` and `map` methods with [`fold`][fold].

## Approach: `filter` and `map` with `foreach`

```d
module isogram;

import std.algorithm.iteration : filter, map;
import std.ascii : isAlpha, toLower;

bool isIsogram(string phrase)
{
    uint ltrs = 0;
    foreach (ltr; phrase.filter!isAlpha
        .map!toLower)
    {
        if (!(ltrs & (1 << (ltr - 'a'))))
            ltrs = ltrs | (1 << (ltr - 'a'));
        else
            return false;

    }
    return true;
}
```

For more information, check the [`filter` and  `map` with `foreach` approach][approach-filter-map-foreach].

## Approach: `filter` and `map` with `fold`

```d
import std.algorithm.iteration : filter, fold, map;
import std.ascii : isAlpha, toLower;

bool isIsogram(string phrase)
{
    uint letters = 0;
    return (phrase.filter!isAlpha
            .map!toLower
            .fold!((a, c) =>
                a & (1 << (c - 'a')) ? a | (1 << 26) : a | (1 << (c - 'a')))(letters) & (1 << 26)) == 0;
}
```

For more information, check the [`filter` and  `map` with `fold` approach][approach-filter-map-fold].

## Which approach to use?

The function can return immediately from the `foreach` if a character has already been used.
The `fold` iterates all characters before it returns, and is also less readable.

[approach-filter-map-foreach]: https://exercism.org/tracks/d/exercises/isogram/approaches/filter-map-foreach
[approach-filter-map-fold]: https://exercism.org/tracks/d/exercises/isogram/approaches/filter-map-fold
[filter]: https://dlang.org/phobos/std_algorithm_iteration.html#.filter
[map]: https://dlang.org/phobos/std_algorithm_iteration.html#map
[foreach]: https://tour.dlang.org/tour/en/basics/foreach
[fold]: https://dlang.org/phobos/std_algorithm_iteration.html#fold
