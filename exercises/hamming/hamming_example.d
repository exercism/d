module hamming;

import std.range : zip;
import std.algorithm : count;

ulong hamming(const char[] a, const char[] b)
in {
    assert(a.length == b.length);
}
body {
    return zip(a, b).count!(a => a[0] != a[1]);
}
