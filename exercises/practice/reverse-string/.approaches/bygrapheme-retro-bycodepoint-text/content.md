# `byGrapheme` and `retro` with `byCodePoint` and `text`

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

This approach starts by importing from libraries for what is needed.

The `reverseString` function is marked [`@safe`][safe] to ensure the compiler disallows certain unsafe practices in the function implementation.
It is also marked as [`pure`][pure] to ensure it does not modify any state external to itself.

[Uniform Function Call Syntax][ufcs] is used to call a chain of functions, starting with the [`byGrapheme`][bygrapheme] function called on the text input.
`byGraphemes` iterates the characters in the input `string` by [Grapheme][grapheme]s, so that a character and its [diacritic][diacritic] will remain
associated together.

The graphemes are passed into the [`array`][array] function so they can be reversed by the [`retro`][retro] function.

The `retro` function reverses the array of graphemes and passes them into the [`byCodePoint`][bycodepoint] function.

The `byCodePoints` function transforms the graphemes back into code points, which are the original characters.

The code points are converted back into a `string` by the [`text`][text] function.

Finally, the function returns the reversed graphemes as a `string`.

If this test is added

```d
// // Unicode diacritic
assert(reverseString("Amélie") == "eilémA");
```

It can be seen that if the graphemes are not reversed, the accent diacritic willl not be over the `e`, but over the `l`.

```
eiĺemA
```

However, by reversing the grapehemes, the accent diacritic remains over the `e`.

```
eilémA
```

[safe]: https://dlang.org/spec/function.html#function-safety
[pure]: https://dlang.org/spec/function.html#pure-functions
[ufcs]: https://tour.dlang.org/tour/en/gems/uniform-function-call-syntax-ufcs
[bygrapheme]: https://dlang.org/phobos/std_uni.html#byGrapheme
[grapheme]: https://dlang.org/phobos/std_uni.html#Grapheme
[diacritic]: https://en.wikipedia.org/wiki/Diacritic
[array]: https://dlang.org/phobos/std_array.html#array
[retro]: https://dlang.org/phobos/std_range.html#retro
[bycodepoint]: https://dlang.org/phobos/std_uni.html#byCodePoint
[text]: https://dlang.org/phobos/std_conv.html#text
