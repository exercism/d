# `all` with `find`

```d
module pangram;

import std.algorithm.searching : all, find;
import std.range : empty;
import std.uni : toLower;

private immutable abc = "abcdefghijklmnopqrstuvwxyz";

@safe
bool isPangram(string text)
{
    auto textLowered = text.toLower;
    return abc.all!((ltr) => !textLowered.find(ltr).empty);
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

A binding is defined for the text input lowerecased with the [toLower][tolower] function using [Uniform Function Call Syntax][ufcs].

```d
auto textLowered = text.toLower;
return abc.all!((ltr) => !textLowered.find(ltr).empty);
```

The [`all`][all] function is then called on the `string` of English letters.
The [lambda][lambda] takes each letter from the English letters and passes it to the [`find`][find] function called on the lowercased input.
The `lambda` uses the [logical NOT][logical-not] operator (`!`) to test the result of calling the `find` function.

If the `find` function does not return an [`empty`][empty] result, then the letter was found, and `find` returns `true`, otherwise it returns `false`.
If all calls to `find` are `true`, then `all` returns `true`.
If any call to `find` returns `false`, then `all` returns `false`.

Finally, `isPangram ` returns the result of calling `all`.

[immutable]: https://dlang.org/spec/const3.html#immutable_storage_class
[string]: https://dlang.org/phobos/std_string.html
[safe]: https://dlang.org/spec/function.html#function-safety
[tolower]: https://dlang.org/phobos/std_uni.html#toLower
[ufcs]: https://tour.dlang.org/tour/en/gems/uniform-function-call-syntax-ufcs
[all]: https://dlang.org/phobos/std_algorithm_searching.html#all
[lambda]: https://tour.dlang.org/tour/en/basics/delegates
[dchar]: https://tour.dlang.org/tour/en/basics/basic-types
[find]: https://dlang.org/phobos/std_algorithm_searching.html#find
[empty]: https://dlang.org/phobos/std_range_primitives.html#empty
[logical-not]: https://dlang.org/spec/expression.html#UnaryExpression
