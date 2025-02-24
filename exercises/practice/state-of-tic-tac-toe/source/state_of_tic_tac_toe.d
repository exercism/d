module state_of_tic_tac_toe;

enum State {
    win,
    draw,
    ongoing
}

pure State gamestate(immutable string[] board)
{
    // implement this function
}

unittest
{
    import std.algorithm.comparison : equal;
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 0;

    // Won games-Finished game where X won via left column victory
    {
        immutable string[] board = [
            "XOO",
            "X  ",
            "X  ",
        ];
        assert(equal(gamestate(board), State.win));
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
            assert(equal(gamestate(board), State.win));
        }

        // Won games-Finished game where X won via right column victory
        {
            immutable string[] board = [
                "OOX",
                "  X",
                "  X",
            ];
            assert(equal(gamestate(board), State.win));
        }

        // Won games-Finished game where O won via left column victory
        {
            immutable string[] board = [
                "OXX",
                "OX ",
                "O  ",
            ];
            assert(equal(gamestate(board), State.win));
        }

        // Won games-Finished game where O won via middle column victory
        {
            immutable string[] board = [
                "XOX",
                " OX",
                " O ",
            ];
            assert(equal(gamestate(board), State.win));
        }

        // Won games-Finished game where O won via right column victory
        {
            immutable string[] board = [
                "XXO",
                " XO",
                "  O",
            ];
            assert(equal(gamestate(board), State.win));
        }

        // Won games-Finished game where X won via top row victory
        {
            immutable string[] board = [
                "XXX",
                "XOO",
                "O  ",
            ];
            assert(equal(gamestate(board), State.win));
        }

        // Won games-Finished game where X won via middle row victory
        {
            immutable string[] board = [
                "O  ",
                "XXX",
                " O ",
            ];
            assert(equal(gamestate(board), State.win));
        }

        // Won games-Finished game where X won via bottom row victory
        {
            immutable string[] board = [
                " OO",
                "O X",
                "XXX",
            ];
            assert(equal(gamestate(board), State.win));
        }

        // Won games-Finished game where O won via top row victory
        {
            immutable string[] board = [
                "OOO",
                "XXO",
                "XX ",
            ];
            assert(equal(gamestate(board), State.win));
        }

        // Won games-Finished game where O won via middle row victory
        {
            immutable string[] board = [
                "XX ",
                "OOO",
                "X  ",
            ];
            assert(equal(gamestate(board), State.win));
        }

        // Won games-Finished game where O won via bottom row victory
        {
            immutable string[] board = [
                "XOX",
                " XX",
                "OOO",
            ];
            assert(equal(gamestate(board), State.win));
        }

        // Won games-Finished game where X won via falling diagonal victory
        {
            immutable string[] board = [
                "XOO",
                " X ",
                "  X",
            ];
            assert(equal(gamestate(board), State.win));
        }

        // Won games-Finished game where X won via rising diagonal victory
        {
            immutable string[] board = [
                "O X",
                "OX ",
                "X  ",
            ];
            assert(equal(gamestate(board), State.win));
        }

        // Won games-Finished game where O won via falling diagonal victory
        {
            immutable string[] board = [
                "OXX",
                "OOX",
                "X O",
            ];
            assert(equal(gamestate(board), State.win));
        }

        // Won games-Finished game where O won via rising diagonal victory
        {
            immutable string[] board = [
                "  O",
                " OX",
                "OXX",
            ];
            assert(equal(gamestate(board), State.win));
        }

        // Won games-Finished game where X won via a row and a column victory
        {
            immutable string[] board = [
                "XXX",
                "XOO",
                "XOO",
            ];
            assert(equal(gamestate(board), State.win));
        }

        // Won games-Finished game where X won via two diagonal victories
        {
            immutable string[] board = [
                "XOX",
                "OXO",
                "XOX",
            ];
            assert(equal(gamestate(board), State.win));
        }

        // Drawn games-Draw
        {
            immutable string[] board = [
                "XOX",
                "XXO",
                "OXO",
            ];
            assert(equal(gamestate(board), State.draw));
        }

        // Drawn games-Another draw
        {
            immutable string[] board = [
                "XXO",
                "OXX",
                "XOO",
            ];
            assert(equal(gamestate(board), State.draw));
        }

        // Ongoing games-Ongoing game: one move in
        {
            immutable string[] board = [
                "   ",
                "X  ",
                "   ",
            ];
            assert(equal(gamestate(board), State.ongoing));
        }

        // Ongoing games-Ongoing game: two moves in
        {
            immutable string[] board = [
                "O  ",
                " X ",
                "   ",
            ];
            assert(equal(gamestate(board), State.ongoing));
        }

        // Ongoing games-Ongoing game: five moves in
        {
            immutable string[] board = [
                "X  ",
                " XO",
                "OX ",
            ];
            assert(equal(gamestate(board), State.ongoing));
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
