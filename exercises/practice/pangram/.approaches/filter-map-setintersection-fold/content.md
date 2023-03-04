# `filter` and `map` with `setIntersection` and `fold`

```d
module pangram;

import std.algorithm : filter, map;
import std.algorithm.iteration : fold;
import std.algorithm.setops : setIntersection;
import std.array : array;
import std.ascii : isAlpha, toLower;

private immutable abc = "abcdefghijklmnopqrstuvwxyz";

@safe
pure bool isPangram(string text)
{
    return text.filter!isAlpha
        .map!toLower
        .setIntersection(abc)
        .fold!((a, _) => a + 1)(0) == 26;
}
```

This approach starts by importing from libraries for what is needed.

An [`immutable`][immutable] binding to a `string` of all the English lowercase letters is defined.
Although a [`string`][string] type is immutable, meaning it can't be modified in place,
the `immutable` binding ensures that the `abc` binding can't be assigned to another `string`.

```d
import std;
void main()
{
    auto ab = "ab";
    // ab[0] = "b"; // compile error: cannot modify `immutable` expression `ab[0]`
    ab = "cd"; // okay to set a mutable binding to another value
    immutable cd = ab; // okay to set an immutable binding to the value of a mutable binding
    // cd = "ef"; //compile error: cannot modify `immutable` expression `cd`
    ab = "gh"; // still okay to set a mutable binding to another value
    writeln(ab);
    writeln(cd);
}

// prints gh
// prints cd
```

In the above code example, we see that, although the `ab` binding is not immutable, we still can't change it in place, as all strings are immutable.
We can, however, change the `ab` binding to another value.

We can set the immutable binding of `cd` to the current value of the mutable `ab` binding.
Once the immutable `cd` binding is set, we cannot set it to another value.

Although the immutable `cd` binding was set to the value of `ab`, `ab` can still be changed to another value independent of the `cd` binding.
The `ab`binding is changed to the `"gh"` value, and the `cd` binding still has its `"cd"` value.

The `isPangram` function is marked [`@safe`][safe] to ensure the compiler disallows certain unsafe practices in the function implementation.
It is also marked as [`pure`][pure] to ensure it does not modify any state external to itself.

The [`filter`][filter] function is called on the input text.
It uses the [`isAlpha`][isalpha] function to filter in only characters that are [ASCII][ascii] alphabetic.
The surviving letters are passed into the [`map`][map] function, which passes each letter to the [toLower][tolower] function.

```exercism/note
The Unicode `std.uni.toLower` function can be called on an entire `string`,
but the ASCII `std.ascii.toLower` function must be called on each character.
```

The lowercased letters are fed into the [`setIntersection`][setintersection] function, where they are compared
with the `string` of lowercase English letters passed in.
The result of `setIntersection` is all of the letters which are in both the filtered and lowercased input text
and in the `string` of lowercase English letters.
Since there is only one of each letter in the `string` of of lowercase English letters, there will be only one each
of any matching duplicate letters from the input text in the `setIntersection`.

If all of the English letters are in the input text, then the number of letters resulting from `setIntersection` will be `26`.

To count the letters, they are passed in to the [`fold`][fold] function, which is seeded with `0`.
The [lambda][lambda] takes `a` for the accumulating value and the character is disregarded. 
`1` is added to the accumulating value for each iteration.

When the `fold` is done, it returns the count of elements resulting from the `setIntersection`.
If all of the English letters are in the text input, then the result will equal `26`.

Finally, `isPangram` returns the result of comparing the result of the calculations with `26`.

[immutable]: https://dlang.org/spec/const3.html#immutable_storage_class
[string]: https://dlang.org/phobos/std_string.html
[filter]: https://dlang.org/phobos/std_algorithm_iteration.html#.filter
[ascii]: https://www.asciitable.com/
[map]: https://dlang.org/phobos/std_algorithm_iteration.html#map
[setintersection]: https://dlang.org/phobos/std_algorithm_setops.html#setIntersection
[fold]: https://dlang.org/phobos/std_algorithm_iteration.html#fold
[sort]: https://dlang.org/phobos/std_algorithm_sorting.html#sort
[safe]: https://dlang.org/spec/function.html#function-safety
[pure]: https://dlang.org/spec/function.html#pure-functions
[isalpha]: https://dlang.org/phobos/std_ascii.html#isAlpha
[tolower]: https://dlang.org/library/std/ascii/to_lower.html
[lambda]: https://tour.dlang.org/tour/en/basics/delegates
