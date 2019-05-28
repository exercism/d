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

unittest
{
    assert(ResistorColor.colorCode("black") == 0);
    assert(ResistorColor.colorCode("white") == 9);
    assert(ResistorColor.colorCode("orange") == 3);
    assert(ResistorColor.colors == [
            "black", "brown", "red", "orange", "yellow", "green", "blue",
            "violet", "grey", "white"
            ]);
}
