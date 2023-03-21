# Introduction

There are several ways to solve Hamming.
One approach is to use the [`zip`][zip] method with the [`count`][count] method.

## Approach: `zip` with `count`

```d
module hamming;

import std.algorithm.searching : count;
import std.exception : enforce;
import std.range : zip;

@safe pure ulong distance(string a, string b)
{
    enforce(a.length == b.length, "strands must be of equal length");
    return a.zip(b)
        .count!((strands) => strands[0] != strands[1]);
}
```

For more information, check the [`zip` with `count` approach][approach-zip-count].

[approach-zip-count]: https://exercism.org/tracks/d/exercises/hamming/approaches/zip-count
[zip]: https://dlang.org/phobos/std_range.html#zip
[count]: https://dlang.org/phobos/std_algorithm_searching.html#count
