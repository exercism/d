module reverse_string;

import std.algorithm.mutation;

pure string reverseString(immutable string value)
{
    return value.dup.reverse;
}
