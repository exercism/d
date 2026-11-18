module resistor_color_tolerance;

import std.algorithm.searching : countUntil;

class ResistorColorTolerance
{
    static pure string label(immutable string[] bands)
    {
        if (bands.length == 1)
            return "0 ohms";

        immutable tolerance = tolerances[toleranceColors.countUntil(bands[$ - 1])];
        long multiplier = colors.countUntil(bands[$ - 2]) + 1;
        immutable char first = digit(bands[0]);
        immutable char second = digit(bands[1]);
        char third = '0';
        if (bands.length == 5)
        {
            third = digit(bands[2]);
            ++multiplier;
        }

        string answer;
        final switch (multiplier % 3)
        {
        case 0:
            answer ~= first;
            if (second != '0' || third != '0')
                answer ~= ['.', second];
            if (third != '0')
                answer ~= third;
            break;
        case 1:
            if (first != '0')
                answer ~= first;
            answer ~= second;
            if (third != '0')
                answer ~= ['.', third];
            break;
        case 2:
            if (first != '0')
                answer ~= first;
            if (first != '0' || second != '0')
                answer ~= second;
            answer ~= third;
            break;
        }

        return answer ~ " " ~ prefixes[multiplier / 3] ~ "ohms " ~ tolerance;
    }

    private static pure char digit(string color)
    {
        return cast(char)('0' + colors.countUntil(color));
    }

    private static immutable colors = [
        "black", "brown", "red", "orange",
        "yellow", "green", "blue", "violet",
        "grey", "white"
    ];

    private static immutable toleranceColors = [
        "grey", "violet", "blue", "green",
        "brown", "red", "gold", "silver"
    ];

    private static immutable tolerances = [
        "±0.05%", "±0.1%", "±0.25%", "±0.5%",
        "±1%", "±2%", "±5%", "±10%"
    ];

    private static immutable prefixes = ["", "kilo", "mega", "giga"];
}
