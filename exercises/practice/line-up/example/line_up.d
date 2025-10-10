module line_up;

import std.array : appender;
import std.format : formattedWrite;

pure string format(immutable string name, uint number)
{
    auto builder = appender!string();
    builder.put(name);
    builder.put(", you are the ");
    builder.formattedWrite("%d", number);
    builder.put(suffix(number));
    builder.put(" customer we serve today. Thank you!");

    return builder.data;
}

pure string suffix(uint number)
{
    uint units = number % 10;
    uint tens = number / 10 % 10;
    if (tens != 1)
    {
        if (units == 1)
        {
            return "st";
        }
        if (units == 2)
        {
            return "nd";
        }
        if (units == 3)
        {
            return "rd";
        }
    }
    return "th";
}
