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
