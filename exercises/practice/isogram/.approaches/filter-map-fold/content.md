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

This approach starts by importing from libraries for what is needed.

The `isIsogram` function is marked [`@safe`][safe] to ensure the compiler disallows certain unsafe practices in the function implementation.
It is also marked as [`pure`][pure] to ensure it does not modify any state external to itself.

An unsigned integer ([`uint`][uint]) binding is defined to hold the bits representing the lowercase letters of the English alphabet.

[Uniform Function Call Syntax][ufcs] is used to call a chain of functions, starting with the [`filter`][filter] method to filter in
only [ASCII][ascii] characters.
The surviving characters are passed to the [`map`][map] method, which in turn passes each ASCII character to the [`toLower`][tolower] method.

The lowercase ASCII characters are passed to the [`fold`][fold] method, which takes the `uint` for the initial accumulating value.

The [lambda][lambda] inside `fold` takes the accumulating value and the character being iterated.

The [conditional expression][conditional] (also known as a ternary expression) takes each letter and subtracts it by `a`.
This results in subtracting the ASCII value of the lowercase letter by the ASCII value of `a`.
If the lowercase letter is `a`, then `a` minus `a` will result in `0`.
If the lowercase letter is `z`, then `z` minus `a` will result in `25`.

The value of `1` is shifted left (`<<`) for the number of positions as the letter minus `a`.
So `a` would have `1` shifted left 0 places (so not shifted at all) and `z` would have `1` shifted left 25 places.
The bitwise AND operator (`&`) is used to check if the bit at that position in the accumulator `uint` is set to `1` .
if not, then the bitwise OR operator (`|`) is used to set the bit to `1` at that position in the accumulator `uint`.
So, in the accumulator `uint`, with the values for `a` and `z` both set, the bits would look like

```
      zyxwvutsrqponmlkjihgfedcba
00000010000000000000000000000001
```

If the bit has already been set, then the bitwise OR operator (`|`) is used to set the bit to `1` at position `26` in the accumulator `uint`.

The bitwise AND operator (`&`) is used to check if the result of `fold` has its bit at position `26` set.
The function returns `true` if bit `26` is not set, otherwise it returns `false`.

For further ways of handling bitwise operations, check the [`std.bitmanip`][bitmanip] library.

[uint]: https://tour.dlang.org/tour/en/basics/basic-types
[safe]: https://dlang.org/spec/function.html#function-safety
[pure]: https://dlang.org/spec/function.html#pure-functions
[filter]: https://dlang.org/phobos/std_algorithm_iteration.html#.filter
[map]: https://dlang.org/phobos/std_algorithm_iteration.html#map
[tolower]: https://dlang.org/phobos/std_ascii.html#toLower
[ufcs]: https://tour.dlang.org/tour/en/gems/uniform-function-call-syntax-ufcs
[isalpha]: https://dlang.org/phobos/std_ascii.html#isAlpha
[ascii]: https://www.asciitable.com/
[fold]: https://dlang.org/phobos/std_algorithm_iteration.html#fold
[lambda]: https://tour.dlang.org/tour/en/basics/delegates
[conditional]: https://dlang.org/spec/expression.html#conditional_expressions
[bitmanip]: https://dlang.org/library/std/bitmanip.html
