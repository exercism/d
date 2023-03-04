# Bitwise operations with `filter` and `fold`

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

This approach starts by importing from libraries for what is needed.

The `isPangram` function is marked [`@safe`][safe] to ensure the compiler disallows certain unsafe practices in the function implementation.

An unsigned integer ([`uint`][uint]) binding is defined to hold the bits representing the lowercase letters of the English alphabet.

[Uniform Function Call Syntax][ufcs] is used to call a chain of functions, starting with the [toLower][tolower] function called on the text input.

The lowercased characters are passed into the [`filter`][filter] function,
which uses the [`isAlpha`][isalpha] function to filter in only characters that are [ASCII][ascii] alphabetic.

The surviving letters are passed into the [`fold`][fold] function which is seeded with `letters` value of `0`.
The [lambda][lambda] takes each letter TODO

[uint]: https://tour.dlang.org/tour/en/basics/basic-types
[safe]: https://dlang.org/spec/function.html#function-safety
[filter]: https://dlang.org/phobos/std_algorithm_iteration.html#.filter
[fold]: https://dlang.org/phobos/std_algorithm_iteration.html#fold
[tolower]: https://dlang.org/phobos/std_uni.html#toLower
[ufcs]: https://tour.dlang.org/tour/en/gems/uniform-function-call-syntax-ufcs
[isalpha]: https://dlang.org/phobos/std_ascii.html#isAlpha
[ascii]: https://www.asciitable.com/
[lambda]: https://tour.dlang.org/tour/en/basics/delegates
