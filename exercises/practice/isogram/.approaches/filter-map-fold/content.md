# `filter` and `map` with `fold`

```d
import std.algorithm.iteration : filter, fold, map;
import std.ascii : isAlpha, toLower;

@safe pure bool isIsogram(string phrase)
{
    uint letters = 0;
    return (phrase.filter!isAlpha
            .map!toLower
            .fold!((a, c) =>
                a & (1 << (c - 'a')) ? a | (1 << 26) : a | (1 << (c - 'a')))(letters) & (1 << 26)) == 0;
}
```

TODO
