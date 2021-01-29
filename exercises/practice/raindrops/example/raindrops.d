module raindrops;

import std.array : appender;
import std.format : formattedWrite;

pure string convert(immutable int n)
{
    auto builder = appender!string();
    if (isPling(n) || isPlang(n) || isPlong(n))
    {
        if (isPling(n))
        {
            builder.put("Pling");
        }
        if (isPlang(n))
        {
            builder.put("Plang");
        }
        if (isPlong(n))
        {
            builder.put("Plong");
        }
    }
    else
    {
        builder.formattedWrite("%s", n);
    }

    return builder.data;
}

private pure bool isPling(immutable int n)
{
    return n % 3 == 0;
}

private pure bool isPlang(immutable int n)
{
    return n % 5 == 0;
}

private pure bool isPlong(immutable int n)
{
    return n % 7 == 0;
}
