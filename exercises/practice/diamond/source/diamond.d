module diamond;

pure string[] rows(char letter)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Degenerate case with a single 'A' row
    {
        string[] expected = [
            "A",
        ];
        assert(rows('A') == expected);
    }

    static if (allTestsEnabled)
    {
        // Degenerate case with no row containing 3 distinct groups of spaces
        {
            string[] expected = [
                " A ",
                "B B",
                " A ",
            ];
            assert(rows('B') == expected);
        }

        // Smallest non-degenerate case with odd diamond side length
        {
            string[] expected = [
                "  A  ",
                " B B ",
                "C   C",
                " B B ",
                "  A  ",
            ];
            assert(rows('C') == expected);
        }

        // Smallest non-degenerate case with even diamond side length
        {
            string[] expected = [
                "   A   ",
                "  B B  ",
                " C   C ",
                "D     D",
                " C   C ",
                "  B B  ",
                "   A   ",
            ];
            assert(rows('D') == expected);
        }

        // Largest possible diamond
        {
            string[] expected = [
                "                         A                         ",
                "                        B B                        ",
                "                       C   C                       ",
                "                      D     D                      ",
                "                     E       E                     ",
                "                    F         F                    ",
                "                   G           G                   ",
                "                  H             H                  ",
                "                 I               I                 ",
                "                J                 J                ",
                "               K                   K               ",
                "              L                     L              ",
                "             M                       M             ",
                "            N                         N            ",
                "           O                           O           ",
                "          P                             P          ",
                "         Q                               Q         ",
                "        R                                 R        ",
                "       S                                   S       ",
                "      T                                     T      ",
                "     U                                       U     ",
                "    V                                         V    ",
                "   W                                           W   ",
                "  X                                             X  ",
                " Y                                               Y ",
                "Z                                                 Z",
                " Y                                               Y ",
                "  X                                             X  ",
                "   W                                           W   ",
                "    V                                         V    ",
                "     U                                       U     ",
                "      T                                     T      ",
                "       S                                   S       ",
                "        R                                 R        ",
                "         Q                               Q         ",
                "          P                             P          ",
                "           O                           O           ",
                "            N                         N            ",
                "             M                       M             ",
                "              L                     L              ",
                "               K                   K               ",
                "                J                 J                ",
                "                 I               I                 ",
                "                  H             H                  ",
                "                   G           G                   ",
                "                    F         F                    ",
                "                     E       E                     ",
                "                      D     D                      ",
                "                       C   C                       ",
                "                        B B                        ",
                "                         A                         ",
            ];
            assert(rows('Z') == expected);
        }
    }
}
