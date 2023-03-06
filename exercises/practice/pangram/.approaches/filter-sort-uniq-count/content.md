# `filter` and `sort` with `uniq` and `count`

```d
module pangram;

import std.algorithm : filter, map, sort;
import std.algorithm.iteration : uniq;
import std.algorithm.searching : count;
import std.array : array;
import std.ascii : isAlpha, toLower;

private immutable abc = "abcdefghijklmnopqrstuvwxyz";

@safe
pure bool isPangram(string text)
{
    return text.filter!isAlpha
        .map!toLower
        .array
        .sort
        .uniq
        .count == 26;
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

[Uniform Function Call Syntax][ufcs] is used to call a chain of functions, starting with the [`toLower`][tolower] function called on the text input.

The lowercased letters are passed to the [`filter`][filter] function.
It uses the [`isAlpha`][isalpha] function to filter in only characters that are [ASCII][ascii] alphabetic.
The surviving letters are passed into the [`array`][array] function so they can be sorted.

The [`sort`][sort] function sorts the lowercase letters and passes them into the [`uniq`][uniq] function, which requires a sorted array
to work properly.
`uniq` deduplicates the letters so that only one of each character remains.

If all of the English letters are in the input text, then the number of letter elements resulting from `uniq` will be `26`.

To count the letters, they are passed in to the [`count`][count] function.
When `count` is done, it returns the number of elements resulting from `uniq`.
If all of the English letters are in the text input, then the result will equal `26`.

Finally, `isPangram` returns the result of comparing the `count` of `uniq` letters with `26`.

[immutable]: https://dlang.org/spec/const3.html#immutable_storage_class
[string]: https://dlang.org/phobos/std_string.html
[ufcs]: https://tour.dlang.org/tour/en/gems/uniform-function-call-syntax-ufcs
[filter]: https://dlang.org/phobos/std_algorithm_iteration.html#.filter
[ascii]: https://www.asciitable.com/
[array]: https://dlang.org/library/std/array/array.html
[uniq]: https://dlang.org/phobos/std_algorithm_iteration.html#uniq
[count]: https://dlang.org/phobos/std_algorithm_searching.html#count
[sort]: https://dlang.org/phobos/std_algorithm_sorting.html#sort
[safe]: https://dlang.org/spec/function.html#function-safety
[pure]: https://dlang.org/spec/function.html#pure-functions
[isalpha]: https://dlang.org/phobos/std_ascii.html#isAlpha
[tolower]: https://dlang.org/phobos/std_uni.html#toLower
[lambda]: https://tour.dlang.org/tour/en/basics/delegates
