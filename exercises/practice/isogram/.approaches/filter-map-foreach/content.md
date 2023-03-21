# `filter` and `map` with `foreach`

```d
module isogram;

import std.algorithm.iteration : filter, map;
import std.ascii : isAlpha, toLower;

@safe pure bool isIsogram(string phrase)
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

This approach starts by importing from libraries for what is needed.

The `isIsogram` function is marked [`@safe`][safe] to ensure the compiler disallows certain unsafe practices in the function implementation.
It is also marked as [`pure`][pure] to ensure it does not modify any state external to itself.

An unsigned integer ([`uint`][uint]) binding is defined to hold the bits representing the lowercase letters of the English alphabet.

[Uniform Function Call Syntax][ufcs] is used to call a chain of functions, starting with the [`filter`][filter] method to filter in
only [ASCII][ascii] characters.
The surviving characters are passed to the [`map`][map] method, which in turn passes each ASCII character to the [`toLower`][tolower] method.

The lowercase ASCII characters are iterated with [`foreach`][foreach].

The `if` statement takes each letter and subtracts it by `a`.
This results in subtracting the ASCII value of the lowercase letter by the ASCII value of `a`.
If the lowercase letter is `a`, then `a` minus `a` will result in `0`.
If the lowercase letter is `z`, then `z` minus `a` will result in `25`.

The value of `1` is shifted left (`<<`) for the number of positions as the letter minus `a`.
So `a` would have `1` shifted left 0 places (so not shifted at all) and `z` would have `1` shifted left 25 places.
The bitwise AND operator (`&`) is used to check if the bit at that position in the `uint` is set to `1` .
if not, then the bitwise OR operator (`|`) is used to set the bit to `1` at that position in the `uint`.
So, in the `uint`, with the values for `a` and `z` both set, the bits would look like

```
      zyxwvutsrqponmlkjihgfedcba
00000010000000000000000000000001
```

If the bit has already been set, then the letter has already been used, and the function immediately returns `false`.

If the loop completes without finding a duplicate letter (and returning `false`), the function returns `true`.

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
[foreach]: https://tour.dlang.org/tour/en/basics/foreach
[bitmanip]: https://dlang.org/library/std/bitmanip.html
