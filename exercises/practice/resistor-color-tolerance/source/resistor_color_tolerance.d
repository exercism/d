module resistor_color_tolerance;

class ResistorColorTolerance
{
    static pure string label(immutable string[] bands)
    {
        // implement this function
    }
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Orange, orange, black and red
    assert(ResistorColorTolerance.label(["orange", "orange", "black", "red"]) == "33 ohms ±2%");

    static if (allTestsEnabled)
    {
        // Blue, gray, brown and violet
        assert(ResistorColorTolerance.label(["blue", "grey", "brown", "violet"]) == "680 ohms ±0.1%");

        // Red, black, red and green
        assert(ResistorColorTolerance.label(["red", "black", "red", "green"]) == "2 kiloohms ±0.5%");

        // Green, brownm orange and grey
        assert(ResistorColorTolerance.label(["green", "brown", "orange", "grey"]) == "51 kiloohms ±0.05%");

        // Only one band
        assert(ResistorColorTolerance.label(["black"]) == "0 ohms");

        // Orange, orange, yellow, black and brown
        assert(ResistorColorTolerance.label(["orange", "orange", "yellow", "black", "brown"]) == "334 ohms ±1%");

        // Red, green, yellow, yellow and brown
        assert(ResistorColorTolerance.label(["red", "green", "yellow", "yellow", "brown"]) == "2.54 megaohms ±1%");

        // Blue, gray, white, brown and brown
        assert(ResistorColorTolerance.label(["blue", "grey", "white", "brown", "brown"]) == "6.89 kiloohms ±1%");

        // Violet, orange, red and gray
        assert(ResistorColorTolerance.label(["violet", "orange", "red", "grey"]) == "7.3 kiloohms ±0.05%");

        // Brown, red, orange, green and blue
        assert(ResistorColorTolerance.label(["brown", "red", "orange", "green", "blue"]) == "12.3 megaohms ±0.25%");

        // Brown, black, brown, yellow and violet
        assert(ResistorColorTolerance.label(["brown", "black", "brown", "yellow", "violet"]) == "1.01 megaohms ±0.1%");

        // Brown, black, red and red
        assert(ResistorColorTolerance.label(["brown", "black", "red", "red"]) == "1 kiloohms ±2%");

        // Orange, orange, red and gold
        assert(ResistorColorTolerance.label(["orange", "orange", "red", "gold"]) == "3.3 kiloohms ±5%");

        // Orange, orange, green and silver
        assert(ResistorColorTolerance.label(["orange", "orange", "green", "silver"]) == "3.3 megaohms ±10%");

        // White, white, violet and green
        assert(ResistorColorTolerance.label(["white", "white", "violet", "green"]) == "990 megaohms ±0.5%");

        // White, white, grey and blue
        assert(ResistorColorTolerance.label(["white", "white", "grey", "blue"]) == "9.9 gigaohms ±0.25%");
    }
}
