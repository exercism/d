module gigasecond;

import std.datetime;
import core.time : seconds;

enum Gigasecond = seconds(10 ^^ 9);

DateTime add(in DateTime start) pure
{
    return start + Gigasecond;
}
