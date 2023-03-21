# `zip` with `count`

```d
module hamming;

import std.algorithm.searching : count;
import std.exception : enforce;
import std.range : zip;

@safe pure ulong distance(string a, string b)
{
    enforce(a.length == b.length, "strands must be of equal length");
    return a.zip(b)
        .count!((strands) => strands[0] != strands[1]);
}
```

This approach starts by importing from libraries for what is needed.

The `isPangram` function is marked [`@safe`][safe] to ensure the compiler disallows certain unsafe practices in the function implementation.
It is also marked as [`pure`][pure] to ensure it does not modify any state external to itself.

The [`enforce`][enforce] method is used to check that the lengths of the two strands are the same.
If they are not, then an exeption is thrown which will have the string argument as its message.

You may see functions which use `enforce` in an `in` block contract [precondition][precondition], like so:

```d
@safe pure ulong distance(string a, string b)
in
{
    enforce(a.length == b.length, "strands must be of equal length");
}
do
{
    return a.zip(b)
        .count!((strands) => strands[0] != strands[1]);
}
```

However, an issue with contracts is that contracts are compiled out when compiling with `-release`.

If the strands are the same length, then the [`zip`][zip] method is used to combine each character of the two strands into a tuple,
so if the strands are "AC" and "GT", then zipped they would be something like  `['A', 'G'], ['C', 'T']`.

The [`count`][count] method is used to compare the characters in each tuple.
The [lambda][lambda] takes the tuple as an argument and returns `true` if the elements are not equal.
The `count` function returns how many iterations had a `true` result.

[safe]: https://dlang.org/spec/function.html#function-safety
[pure]: https://dlang.org/spec/function.html#pure-functions
[precondition]: https://dlang.org/spec/function#preconditions
[enforce]: https://dlang.org/phobos/std_exception.html#enforce
[zip]: https://dlang.org/phobos/std_range.html#zip
[count]: https://dlang.org/phobos/std_algorithm_searching.html#count
[lambda]: https://tour.dlang.org/tour/en/basics/delegates
