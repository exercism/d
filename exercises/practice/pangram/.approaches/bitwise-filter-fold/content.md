# Bitwise operations with `filter` and `fold`

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

This approach starts by importing from libraries for what is needed.

The `isPangram` function is marked [`@safe`][safe] to ensure the compiler disallows certain unsafe practices in the function implementation.
It is also marked as [`pure`][pure] to ensure it does not modify any state external to itself.

An unsigned integer ([`uint`][uint]) binding is defined to hold the bits representing the lowercase letters of the English alphabet.

[Uniform Function Call Syntax][ufcs] is used to call a chain of functions, starting with the [toLower][tolower] function called on the text input.

The lowercased characters are passed into the [`filter`][filter] function,
which uses the [`isAlpha`][isalpha] function to filter in only characters that are [ASCII][ascii] alphabetic.

The surviving letters are passed into the [`fold`][fold] function which is seeded with the unsigned integer.
The [lambda][lambda] takes each letter and subtracts it by `a`.
This results in subtracting the ASCII value of the lowercase letter by the ASCII value of `a`.
If the lowercase letter is `a`, then `a` minus `a` will result in `0`.
If the lowercase letter is `z`, then `z` minus `a` will result in `25`.

The value of `1` is shifted left (`<<`) for the number of positions as the letter minus `a`.
So `a` would have `1` shifted left 0 places (so not shifted at all) and `z` would have `1` shifted left 25 places.
The bitwise OR operator (`|`) is used to set the bit to `1` at that position in the `uint`.
So, in the `uint`, with the values for `a` and `z` both set, the bits would look like

```
      zyxwvutsrqponmlkjihgfedcba
00000010000000000000000000000001
```

When the `fold` is done, it returns the value of the unsigned integer as modified by the bits that were set.
If the bits for all of the English letters are set, then the result will equal the binary literal which has its
rightmost `26` bits set.

Finally, `isPangram` returns the result of comparing the bits set from the input text with all bits being set.

For further ways of handling bitwise operations, check the [`std.bitmanip`][bitmanip] library.

[uint]: https://tour.dlang.org/tour/en/basics/basic-types
[safe]: https://dlang.org/spec/function.html#function-safety
[pure]: https://dlang.org/spec/function.html#pure-functions
[filter]: https://dlang.org/phobos/std_algorithm_iteration.html#.filter
[fold]: https://dlang.org/phobos/std_algorithm_iteration.html#fold
[tolower]: https://dlang.org/phobos/std_uni.html#toLower
[ufcs]: https://tour.dlang.org/tour/en/gems/uniform-function-call-syntax-ufcs
[isalpha]: https://dlang.org/phobos/std_ascii.html#isAlpha
[ascii]: https://www.asciitable.com/
[lambda]: https://tour.dlang.org/tour/en/basics/delegates
[bitmanip]: https://dlang.org/library/std/bitmanip.html
