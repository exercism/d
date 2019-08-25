module resistor_color_duo;

import std.algorithm.searching : countUntil;
import std.algorithm.iteration;
import std.conv;

class ResistorColorDuo
{
    private static immutable colors = [
        "black", "brown", "red", "orange", "yellow", "green", "blue", "violet",
        "grey", "white"
    ];

    static pure long value(immutable string[] colorsInput)
    {
        return 10 * this.colors.countUntil(colorsInput[0]) + this.colors.countUntil(colorsInput[1]);
    }
}
