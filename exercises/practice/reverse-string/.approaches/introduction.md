# Introduction

There are several ways to solve Reverse String.
One approach is to [`reverse`][reverse] in place, like so

```d
module reverse_string;

import std.algorithm.mutation : reverse;
import std.array : array;
import std.conv : text;

@safe pure string reverseString(string phrase)
{
    return phrase.array.reverse.text;
}
```

Another approach is to use the [`retro`][retro] function, like so

```d
module reverse_string;

import std.conv : text;
import std.range : retro;

@safe pure string reverseString(string phrase)
{
    return phrase.retro.text;
}
```

However, neither of those approaches will properly reverse strings which contain a Unicode character with a [diacritic][diacritic].

At the time of writing, the tests don't require that Unicode characters can be properly reversed.
But, if you would like to properly reverse a string containing Unicode diacritics, then one approach could use the
[`byGrapheme`][bygrapheme], [`retro`][retro], [`byCodePoint`][bycodepoint], and [`text`][text] functions.


## Approach: `byGrapheme` and `retro` with `byCodePoint` and `text`

```d
module reverse_string;

import std.array : array;
import std.conv : text;
import std.range : retro;
import std.uni : byCodePoint, byGrapheme;

@safe pure string reverseString(string phrase)
{
    return phrase.byGrapheme.array.retro.byCodePoint.text;
}
```

For more information, check the [`byGrapheme` and `retro` with `byCodePoint` and `text` approach][approach-bygrapheme-retro-bycodepoint-text]

## Which approach to use?

At the time of writing, all of the tests will pass with either the `reverse` or `retro` approach.
However, if you have a need to reverse Unicode strings containing diacritics, then the `byGrapheme/byCodePoint` approach will be handy.

[reverse]: https://dlang.org/phobos/std_algorithm_mutation.html#reverse
[retro]: https://dlang.org/phobos/std_range.html#retro
[diacritic]: https://en.wikipedia.org/wiki/Diacritic
[bygrapheme]: https://dlang.org/phobos/std_uni.html#byGrapheme
[bycodepoint]: https://dlang.org/phobos/std_uni.html#byCodePoint
[text]: https://dlang.org/phobos/std_conv.html#text
[approach-bygrapheme-retro-bycodepoint-text]: https://exercism.org/tracks/d/exercises/reverse-string/approaches/bygrapheme-retro-bycodepoint-text
