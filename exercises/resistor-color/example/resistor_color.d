module resistor_color;

import std.algorithm.searching : countUntil;

class ResistorColor
{
    static immutable colors = [
        "black", "brown", "red", "orange", "yellow", "green", "blue", "violet",
        "grey", "white"
    ];

    static pure long colorCode(immutable string color)
    {
        return this.colors.countUntil(color);
    }
}
