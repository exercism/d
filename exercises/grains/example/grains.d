module grains;

import std.algorithm.iteration : fold;
import std.exception : enforce;
import std.range : iota;
import std.math : pow;

pure ulong square(immutable ulong num)
{
    enforce(num > 0 && num < 65, "square must be between 1 and 64");
    return pow(2, (num - 1));
}

pure ulong total()
{
    return iota(1, 65).fold!((sum, n) => sum + square(n));
}
