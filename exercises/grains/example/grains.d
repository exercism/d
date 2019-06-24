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

unittest
{
    import std.exception : assertThrown;

    assert(square(1) == 1);
    assert(square(2) == 2);
    assert(square(3) == 4);
    assert(square(4) == 8);
    assert(square(16) == 32_768);
    assert(square(32) == 2_147_483_648uL);
    assert(square(64) == 9_223_372_036_854_775_808uL);

    assertThrown(square(0));
    assertThrown(square(-1));
    assertThrown(square(65));

    assert(total() == 18_446_744_073_709_551_615uL);
}
