module ocr_numbers;

pure string convert(immutable string[] rows)
{
    // implement this function
}

unittest
{
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 0;

    // Recognizes 0
    {
        immutable string[] rows = [
            " _ ",
            "| |",
            "|_|",
            "   ",
        ];
        assert(convert(rows) == "0");
    }

    static if (allTestsEnabled)
    {
        // Recognizes 1
        {
            immutable string[] rows = [
                "   ",
                "  |",
                "  |",
                "   ",
            ];
            assert(convert(rows) == "1");
        }

        // Unreadable but correctly sized inputs return ?
        {
            immutable string[] rows = [
                "   ",
                "  _",
                "  |",
                "   ",
            ];
            assert(convert(rows) == "?");
        }

        // Input with a number of lines that is not a multiple of four raises an error
        {
            immutable string[] rows = [
                " _ ",
                "| |",
                "   ",
            ];
            assertThrown(convert(rows));
        }

        // Input with a number of columns that is not a multiple of three raises an error
        {
            immutable string[] rows = [
                "    ",
                "   |",
                "   |",
                "    ",
            ];
            assertThrown(convert(rows));
        }

        // Recognizes 110101100
        {
            immutable string[] rows = [
                "       _     _        _  _ ",
                "  |  || |  || |  |  || || |",
                "  |  ||_|  ||_|  |  ||_||_|",
                "                           ",
            ];
            assert(convert(rows) == "110101100");
        }

        // Garbled numbers in a string are replaced with ?
        {
            immutable string[] rows = [
                "       _     _           _ ",
                "  |  || |  || |     || || |",
                "  |  | _|  ||_|  |  ||_||_|",
                "                           ",
            ];
            assert(convert(rows) == "11?10?1?0");
        }

        // Recognizes 2
        {
            immutable string[] rows = [
                " _ ",
                " _|",
                "|_ ",
                "   ",
            ];
            assert(convert(rows) == "2");
        }

        // Recognizes 3
        {
            immutable string[] rows = [
                " _ ",
                " _|",
                " _|",
                "   ",
            ];
            assert(convert(rows) == "3");
        }

        // Recognizes 4
        {
            immutable string[] rows = [
                "   ",
                "|_|",
                "  |",
                "   ",
            ];
            assert(convert(rows) == "4");
        }

        // Recognizes 5
        {
            immutable string[] rows = [
                " _ ",
                "|_ ",
                " _|",
                "   ",
            ];
            assert(convert(rows) == "5");
        }

        // Recognizes 6
        {
            immutable string[] rows = [
                " _ ",
                "|_ ",
                "|_|",
                "   ",
            ];
            assert(convert(rows) == "6");
        }

        // Recognizes 7
        {
            immutable string[] rows = [
                " _ ",
                "  |",
                "  |",
                "   ",
            ];
            assert(convert(rows) == "7");
        }

        // Recognizes 8
        {
            immutable string[] rows = [
                " _ ",
                "|_|",
                "|_|",
                "   ",
            ];
            assert(convert(rows) == "8");
        }

        // Recognizes 9
        {
            immutable string[] rows = [
                " _ ",
                "|_|",
                " _|",
                "   ",
            ];
            assert(convert(rows) == "9");
        }

        // Recognizes string of decimal numbers
        {
            immutable string[] rows = [
                "    _  _     _  _  _  _  _  _ ",
                "  | _| _||_||_ |_   ||_||_|| |",
                "  ||_  _|  | _||_|  ||_| _||_|",
                "                              ",
            ];
            assert(convert(rows) == "1234567890");
        }

        // Numbers separated by empty lines are recognized. Lines are joined by commas.
        {
            immutable string[] rows = [
                "    _  _ ",
                "  | _| _|",
                "  ||_  _|",
                "         ",
                "    _  _ ",
                "|_||_ |_ ",
                "  | _||_|",
                "         ",
                " _  _  _ ",
                "  ||_||_|",
                "  ||_| _|",
                "         ",
            ];
            assert(convert(rows) == "123,456,789");
        }
    }
}
