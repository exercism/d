module darts;

import std.math : hypot;

pure int score(immutable float x, immutable float y)
{
    immutable float hypot = hypot(x, y);

    if (hypot <= 1)
    {
        return 10;
    }
    else if (hypot <= 5)
    {
        return 5;
    }
    else if (hypot <= 10)
    {
        return 1;
    }

    return 0;
}

unittest
{
    assert(score(-9, 9) == 0);
    assert(score(0, 10) == 1);
    assert(score(4, 4) == 1);
    assert(score(5, 0) == 5);
    assert(score(0.8, -0.8) == 5);
    assert(score(0, -1) == 10);
    assert(score(-0.1, -0.1) == 10);
    assert(score(0.4, 0.8) == 10);
    assert(score(2, 4) == 5);
    assert(score(4, 8) == 1);
}
