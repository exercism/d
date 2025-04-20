module resistor_color_trio;

class ResistorColorTrio
{
        // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Orange and orange and black
    assert(ResistorColorTrio.label(["orange", "orange", "black"]) == "33 ohms");

    static if (allTestsEnabled)
    {
        // Blue and grey and brown
        assert(ResistorColorTrio.label(["blue", "grey", "brown"]) == "680 ohms");
        
        // Red and black and red
        assert(ResistorColorTrio.label(["red", "black", "red"]) == "2 kiloohms");

        // Green and brown and orange
        assert(ResistorColorTrio.label(["green", "brown", "orange"]) == "51 kiloohms");

        // Yellow and violet and yellow
        assert(ResistorColorTrio.label(["yellow", "violet", "yellow"]) == "470 kiloohms");

        // Blue and violet and blue
        assert(ResistorColorTrio.label(["blue", "violet", "blue"]) == "67 megaohms");

        // Minimum possible label
        assert(ResistorColorTrio.label(["black", "black", "black"]) == "0 ohms");

        // Maximum possible label
        assert(ResistorColorTrio.label(["white", "white", "white"]) == "99 gigaohms");

        // First two colors make an invalid octal number
        assert(ResistorColorTrio.label(["black", "grey", "black"]) == "8 ohms");

        // Ignore extra colors
        assert(ResistorColorTrio.label(["blue", "green", "yellow", "orange"]) == "650 kiloohms");
    }
}
