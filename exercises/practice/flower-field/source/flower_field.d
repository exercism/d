module flower_field;

pure string[] annotate(immutable string[] garden)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // No rows
    {
        immutable string[] garden = [
        ];
        string[] expected = [
        ];
        assert(annotate(garden) == expected);
    }

    static if (allTestsEnabled)
    {
        // No columns
        {
            immutable string[] garden = [
                "",
            ];
            string[] expected = [
                "",
            ];
            assert(annotate(garden) == expected);
        }

        // No flowers
        {
            immutable string[] garden = [
                "   ",
                "   ",
                "   ",
            ];
            string[] expected = [
                "   ",
                "   ",
                "   ",
            ];
            assert(annotate(garden) == expected);
        }

        // garden with only flowers
        {
            immutable string[] garden = [
                "***",
                "***",
                "***",
            ];
            string[] expected = [
                "***",
                "***",
                "***",
            ];
            assert(annotate(garden) == expected);
        }

        // Flower surrounded by spaces
        {
            immutable string[] garden = [
                "   ",
                " * ",
                "   ",
            ];
            string[] expected = [
                "111",
                "1*1",
                "111",
            ];
            assert(annotate(garden) == expected);
        }

        // Space surrounded by flowers
        {
            immutable string[] garden = [
                "***",
                "* *",
                "***",
            ];
            string[] expected = [
                "***",
                "*8*",
                "***",
            ];
            assert(annotate(garden) == expected);
        }

        // Horizontal line
        {
            immutable string[] garden = [
                " * * ",
            ];
            string[] expected = [
                "1*2*1",
            ];
            assert(annotate(garden) == expected);
        }

        // Horizontal line, flowers at edges
        {
            immutable string[] garden = [
                "*   *",
            ];
            string[] expected = [
                "*1 1*",
            ];
            assert(annotate(garden) == expected);
        }

        // Vertical line
        {
            immutable string[] garden = [
                " ",
                "*",
                " ",
                "*",
                " ",
            ];
            string[] expected = [
                "1",
                "*",
                "2",
                "*",
                "1",
            ];
            assert(annotate(garden) == expected);
        }

        // Vertical line, flowers at edges
        {
            immutable string[] garden = [
                "*",
                " ",
                " ",
                " ",
                "*",
            ];
            string[] expected = [
                "*",
                "1",
                " ",
                "1",
                "*",
            ];
            assert(annotate(garden) == expected);
        }

        // Cross
        {
            immutable string[] garden = [
                "  *  ",
                "  *  ",
                "*****",
                "  *  ",
                "  *  ",
            ];
            string[] expected = [
                " 2*2 ",
                "25*52",
                "*****",
                "25*52",
                " 2*2 ",
            ];
            assert(annotate(garden) == expected);
        }

        // Large garden
        {
            immutable string[] garden = [
                " *  * ",
                "  *   ",
                "    * ",
                "   * *",
                " *  * ",
                "      ",
            ];
            string[] expected = [
                "1*22*1",
                "12*322",
                " 123*2",
                "112*4*",
                "1*22*2",
                "111111",
            ];
            assert(annotate(garden) == expected);
        }
    }
}
