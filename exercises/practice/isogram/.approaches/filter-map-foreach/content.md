# `filter` and `map` with `foreach`

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

TODO
