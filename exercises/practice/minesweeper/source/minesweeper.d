module minesweeper;

pure string[] annotate(immutable string[] minefield)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // No rows
    {
        immutable string[] minefield = [
        ];
        string[] expected = [
        ];
        assert(annotate(minefield) == expected);
    }

    static if (allTestsEnabled)
    {
        // No columns
        {
            immutable string[] minefield = [
                "",
            ];
            string[] expected = [
                "",
            ];
            assert(annotate(minefield) == expected);
        }

        // No mines
        {
            immutable string[] minefield = [
                "   ",
                "   ",
                "   ",
            ];
            string[] expected = [
                "   ",
                "   ",
                "   ",
            ];
            assert(annotate(minefield) == expected);
        }

        // Minefield with only mines
        {
            immutable string[] minefield = [
                "***",
                "***",
                "***",
            ];
            string[] expected = [
                "***",
                "***",
                "***",
            ];
            assert(annotate(minefield) == expected);
        }

        // Mine surrounded by spaces
        {
            immutable string[] minefield = [
                "   ",
                " * ",
                "   ",
            ];
            string[] expected = [
                "111",
                "1*1",
                "111",
            ];
            assert(annotate(minefield) == expected);
        }

        // Space surrounded by mines
        {
            immutable string[] minefield = [
                "***",
                "* *",
                "***",
            ];
            string[] expected = [
                "***",
                "*8*",
                "***",
            ];
            assert(annotate(minefield) == expected);
        }

        // Horizontal line
        {
            immutable string[] minefield = [
                " * * ",
            ];
            string[] expected = [
                "1*2*1",
            ];
            assert(annotate(minefield) == expected);
        }

        // Horizontal line, mines at edges
        {
            immutable string[] minefield = [
                "*   *",
            ];
            string[] expected = [
                "*1 1*",
            ];
            assert(annotate(minefield) == expected);
        }

        // Vertical line
        {
            immutable string[] minefield = [
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
            assert(annotate(minefield) == expected);
        }

        // Vertical line, mines at edges
        {
            immutable string[] minefield = [
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
            assert(annotate(minefield) == expected);
        }

        // Cross
        {
            immutable string[] minefield = [
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
            assert(annotate(minefield) == expected);
        }

        // Large minefield
        {
            immutable string[] minefield = [
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
            assert(annotate(minefield) == expected);
        }
    }
}
