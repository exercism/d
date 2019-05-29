module resistor_color_duo;

unittest
{
    const int allTestsEnabled = 0;

    // Brown and black
    assert(ResistorColorDuo.value(["brown", "black"]) == 10);

    static if (allTestsEnabled)
    {
        // Blue and grey
        assert(ResistorColorDuo.value(["blue", "grey"]) == 68);

        // Yellow and violet
        assert(ResistorColorDuo.value(["yellow", "violet"]) == 47);

        // Orange and orange
        assert(ResistorColorDuo.value(["orange", "orange"]) == 33);
    }

}
