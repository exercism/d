module state_of_tic_tac_toe;

enum State {
    win,
    draw,
    ongoing
}

pure State gamestate(immutable string[] board)
{
    int count_x = 0;
    int count_o = 0;
    int bitset_x = 0;
    int bitset_o = 0;

    foreach (i, row; board)
    {
        foreach (j, cell; row)
        {
            if (cell == 'X')
            {
                count_x++;
                bitset_x |= (1 << (4 * i + j));
            }

            if (cell == 'O')
            {
                count_o++;
                bitset_o |= (1 << (4 * i + j));
            }
        }
    }

    if (count_o > count_x)
    {
        throw new Exception("Wrong turn order: O started");
    }

    if (count_x > count_o + 1)
    {
        throw new Exception("Wrong turn order: X went twice");
    }

    bool win_x = is_win(bitset_x);
    bool win_o = is_win(bitset_o);

    if (win_x || win_o)
    {
        if (win_x && win_o)
        {
            throw new Exception("Impossible board: game should have ended after the game was won");
        }

        return State.win;
    }

    if (count_x + count_o == 9)
    {
        return State.draw;
    }

    return State.ongoing;
}

private pure bool is_win(immutable int bitset)
{
    const int[] lines = [
        0x007,
        0x070,
        0x700,
        0x111,
        0x222,
        0x444,
        0x124,
        0x421,
    ];

    foreach (line; lines) {
        if ((bitset & line) == line) {
            return true;
        }
    }

    return false;
}

unittest
{
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 0;

    // Won games-Finished game where X won via left column victory
    {
        immutable string[] board = [
            "XOO",
            "X  ",
            "X  ",
        ];
        assert(gamestate(board) == State.win);
    }

    static if (allTestsEnabled)
    {
        // Won games-Finished game where X won via middle column victory
        {
            immutable string[] board = [
                "OXO",
                " X ",
                " X ",
            ];
            assert(gamestate(board) == State.win);
        }

        // Won games-Finished game where X won via right column victory
        {
            immutable string[] board = [
                "OOX",
                "  X",
                "  X",
            ];
            assert(gamestate(board) == State.win);
        }

        // Won games-Finished game where O won via left column victory
        {
            immutable string[] board = [
                "OXX",
                "OX ",
                "O  ",
            ];
            assert(gamestate(board) == State.win);
        }

        // Won games-Finished game where O won via middle column victory
        {
            immutable string[] board = [
                "XOX",
                " OX",
                " O ",
            ];
            assert(gamestate(board) == State.win);
        }

        // Won games-Finished game where O won via right column victory
        {
            immutable string[] board = [
                "XXO",
                " XO",
                "  O",
            ];
            assert(gamestate(board) == State.win);
        }

        // Won games-Finished game where X won via top row victory
        {
            immutable string[] board = [
                "XXX",
                "XOO",
                "O  ",
            ];
            assert(gamestate(board) == State.win);
        }

        // Won games-Finished game where X won via middle row victory
        {
            immutable string[] board = [
                "O  ",
                "XXX",
                " O ",
            ];
            assert(gamestate(board) == State.win);
        }

        // Won games-Finished game where X won via bottom row victory
        {
            immutable string[] board = [
                " OO",
                "O X",
                "XXX",
            ];
            assert(gamestate(board) == State.win);
        }

        // Won games-Finished game where O won via top row victory
        {
            immutable string[] board = [
                "OOO",
                "XXO",
                "XX ",
            ];
            assert(gamestate(board) == State.win);
        }

        // Won games-Finished game where O won via middle row victory
        {
            immutable string[] board = [
                "XX ",
                "OOO",
                "X  ",
            ];
            assert(gamestate(board) == State.win);
        }

        // Won games-Finished game where O won via bottom row victory
        {
            immutable string[] board = [
                "XOX",
                " XX",
                "OOO",
            ];
            assert(gamestate(board) == State.win);
        }

        // Won games-Finished game where X won via falling diagonal victory
        {
            immutable string[] board = [
                "XOO",
                " X ",
                "  X",
            ];
            assert(gamestate(board) == State.win);
        }

        // Won games-Finished game where X won via rising diagonal victory
        {
            immutable string[] board = [
                "O X",
                "OX ",
                "X  ",
            ];
            assert(gamestate(board) == State.win);
        }

        // Won games-Finished game where O won via falling diagonal victory
        {
            immutable string[] board = [
                "OXX",
                "OOX",
                "X O",
            ];
            assert(gamestate(board) == State.win);
        }

        // Won games-Finished game where O won via rising diagonal victory
        {
            immutable string[] board = [
                "  O",
                " OX",
                "OXX",
            ];
            assert(gamestate(board) == State.win);
        }

        // Won games-Finished game where X won via a row and a column victory
        {
            immutable string[] board = [
                "XXX",
                "XOO",
                "XOO",
            ];
            assert(gamestate(board) == State.win);
        }

        // Won games-Finished game where X won via two diagonal victories
        {
            immutable string[] board = [
                "XOX",
                "OXO",
                "XOX",
            ];
            assert(gamestate(board) == State.win);
        }

        // Drawn games-Draw
        {
            immutable string[] board = [
                "XOX",
                "XXO",
                "OXO",
            ];
            assert(gamestate(board) == State.draw);
        }

        // Drawn games-Another draw
        {
            immutable string[] board = [
                "XXO",
                "OXX",
                "XOO",
            ];
            assert(gamestate(board) == State.draw);
        }

        // Ongoing games-Ongoing game: one move in
        {
            immutable string[] board = [
                "   ",
                "X  ",
                "   ",
            ];
            assert(gamestate(board) == State.ongoing);
        }

        // Ongoing games-Ongoing game: two moves in
        {
            immutable string[] board = [
                "O  ",
                " X ",
                "   ",
            ];
            assert(gamestate(board) == State.ongoing);
        }

        // Ongoing games-Ongoing game: five moves in
        {
            immutable string[] board = [
                "X  ",
                " XO",
                "OX ",
            ];
            assert(gamestate(board) == State.ongoing);
        }

        // Invalid boards-Invalid board: X went twice
        {
            immutable string[] board = [
                "XX ",
                "   ",
                "   ",
            ];
            assertThrown(gamestate(board));
        }

        // Invalid boards-Invalid board: O started
        {
            immutable string[] board = [
                "OOX",
                "   ",
                "   ",
            ];
            assertThrown(gamestate(board));
        }

        // Invalid boards-Invalid board: X won and O kept playing
        {
            immutable string[] board = [
                "XXX",
                "OOO",
                "   ",
            ];
            assertThrown(gamestate(board));
        }

        // Invalid boards-Invalid board: players kept playing after a win
        {
            immutable string[] board = [
                "XXX",
                "OOO",
                "XOX",
            ];
            assertThrown(gamestate(board));
        }
    }
}
