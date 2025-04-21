module resistor_color_trio;

import std.algorithm.searching : countUntil;
import std.math.exponential : pow;
import std.format : format;

class ResistorColorTrio
{
    static pure string label(immutable string[] bands)
    {
        long tens = colors.countUntil(bands[0]);
        long ones = colors.countUntil(bands[1]);
        long multiplier = colors.countUntil(bands[2]);
        long value = (10 * tens + ones) * pow(10, multiplier);

        if (value < 1_000)
            return format("%d ohms", value);
        else if (value < 1_000_000)
            return format("%d kiloohms", value / 1_000);
        else if (value < 1_000_000_000)
            return format("%d megaohms", value / 1_000_000);
        else
            return format("%d gigaohms", value / 1_000_000_000);
    }

    private static immutable colors = [
        "black", "brown", "red", "orange", 
        "yellow", "green", "blue", "violet",
        "grey", "white"
    ];
}
