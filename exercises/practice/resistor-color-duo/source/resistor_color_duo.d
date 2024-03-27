module resistor_color_duo;

class ResistorColorDuo
{
    static pure long value(immutable string[] colorsInput)
    {
        // implement this function
    }
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Brown and black
    assert(ResistorColorDuo.value(["brown", "black"]) == 10);

    static if (allTestsEnabled)
    {
        // Blue and grey
        assert(ResistorColorDuo.value(["blue", "grey"]) == 68);

        // Yellow and violet
        assert(ResistorColorDuo.value(["yellow", "violet"]) == 47);

        // White and red
        assert(ResistorColorDuo.value(["white", "red"]) == 92);

        // Orange and orange
        assert(ResistorColorDuo.value(["orange", "orange"]) == 33);

        // Ignore additional colors
        assert(ResistorColorDuo.value(["green", "brown", "orange"]) == 51);

        // Black and brown, one-digit
        assert(ResistorColorDuo.value(["black", "brown"]) == 1);
    }

}
