module rectangles;

// Returns the number of rectangles in the ASCII diagram `strings`.
pure int rectangles(immutable string[] strings)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // No rows
    {
        immutable string[] strings = [
        ];
        assert(rectangles(strings) == 0);
    }

    static if (allTestsEnabled)
    {
        // No columns
        {
            immutable string[] strings = [
                "",
            ];
            assert(rectangles(strings) == 0);
        }

        // No rectangles
        {
            immutable string[] strings = [
                " ",
            ];
            assert(rectangles(strings) == 0);
        }

        // One rectangle
        {
            immutable string[] strings = [
                "+-+",
                "| |",
                "+-+",
            ];
            assert(rectangles(strings) == 1);
        }

        // Two rectangles without shared parts
        {
            immutable string[] strings = [
                "  +-+",
                "  | |",
                "+-+-+",
                "| |  ",
                "+-+  ",
            ];
            assert(rectangles(strings) == 2);
        }

        // Five rectangles with shared parts
        {
            immutable string[] strings = [
                "  +-+",
                "  | |",
                "+-+-+",
                "| | |",
                "+-+-+",
            ];
            assert(rectangles(strings) == 5);
        }

        // Rectangle of height 1 is counted
        {
            immutable string[] strings = [
                "+--+",
                "+--+",
            ];
            assert(rectangles(strings) == 1);
        }

        // Rectangle of width 1 is counted
        {
            immutable string[] strings = [
                "++",
                "||",
                "++",
            ];
            assert(rectangles(strings) == 1);
        }

        // 1x1 square is counted
        {
            immutable string[] strings = [
                "++",
                "++",
            ];
            assert(rectangles(strings) == 1);
        }

        // Only complete rectangles are counted
        {
            immutable string[] strings = [
                "  +-+",
                "    |",
                "+-+-+",
                "| | -",
                "+-+-+",
            ];
            assert(rectangles(strings) == 1);
        }

        // Rectangles can be of different sizes
        {
            immutable string[] strings = [
                "+------+----+",
                "|      |    |",
                "+---+--+    |",
                "|   |       |",
                "+---+-------+",
            ];
            assert(rectangles(strings) == 3);
        }

        // Corner is required for a rectangle to be complete
        {
            immutable string[] strings = [
                "+------+----+",
                "|      |    |",
                "+------+    |",
                "|   |       |",
                "+---+-------+",
            ];
            assert(rectangles(strings) == 2);
        }

        // Large input with many rectangles
        {
            immutable string[] strings = [
                "+---+--+----+",
                "|   +--+----+",
                "+---+--+    |",
                "|   +--+----+",
                "+---+--+--+-+",
                "+---+--+--+-+",
                "+------+  | |",
                "          +-+",
            ];
            assert(rectangles(strings) == 60);
        }

        // Rectangles must have four sides
        {
            immutable string[] strings = [
                "+-+ +-+",
                "| | | |",
                "+-+-+-+",
                "  | |  ",
                "+-+-+-+",
                "| | | |",
                "+-+ +-+",
            ];
            assert(rectangles(strings) == 5);
        }

        // Very large input
        {
            immutable string[] strings = [
                "      +-----+--------+    +-----+ ",
                "++---++-----+--------+---++-----++",
                "||+--++-----+-+-++   |   ||     ||",
                "|||  ||     +-+-++-+ |   ||     ||",
                "|||  ||     | | || | |   ||     ||",
                "||| +++-----+-+-++-+-+---++-+   ||",
                "||| |||     | | || | |+--++-+-+ ||",
                "||| +++---+-+-+-++-+-++--++-+ | ||",
                "||| |||+--+-+-+-+| | |+--++---+ ||",
                "||| ||||  | | | || | |+-+||     ||",
                "||+-++++--+-+++-++-+-++-+++---++||",
                "||  |+++--+-+++-+--+-+| |||   ||||",
                "+++-+++++---++--+-++-++-+++---+|||",
                " |+-+++++---++--+ || || |||   ||||",
                " |  +++++---++--+-++-++-++++  ||||",
                " |   ||||   |+----++-++-++++--+++|",
                " |   |+++---+|    || || ||    || |",
                "+++  |||+---++----+| || ||    || |",
                "|||  +++----++----++-++-++----++-+",
                "+++---++----++-----+-++-++----++  ",
                "                      +-+         ",
            ];
            assert(rectangles(strings) == 2063);
        }
    }
}
