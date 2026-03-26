module connect;

pure string winner(immutable string[] board)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // An empty board has no winner
    {
        immutable string[] board = [
            ". . . . .",
            " . . . . .",
            "  . . . . .",
            "   . . . . .",
            "    . . . . .",
        ];
        assert(winner(board) == "");
    }

    static if (allTestsEnabled)
    {
        // X can win on a 1x1 board
        {
            immutable string[] board = [
                "X",
            ];
            assert(winner(board) == "X");
        }

        // O can win on a 1x1 board
        {
            immutable string[] board = [
                "O",
            ];
            assert(winner(board) == "O");
        }

        // Only edges does not make a winner
        {
            immutable string[] board = [
                "O O O X",
                " X . . X",
                "  X . . X",
                "   X O O O",
            ];
            assert(winner(board) == "");
        }

        // Illegal diagonal does not make a winner
        {
            immutable string[] board = [
                "X O . .",
                " O X X X",
                "  O X O .",
                "   . O X .",
                "    X X O O",
            ];
            assert(winner(board) == "");
        }

        // Nobody wins crossing adjacent angles
        {
            immutable string[] board = [
                "X . . .",
                " . X O .",
                "  O . X O",
                "   . O . X",
                "    . . O .",
            ];
            assert(winner(board) == "");
        }

        // X wins crossing from left to right
        {
            immutable string[] board = [
                ". O . .",
                " O X X X",
                "  O X O .",
                "   X X O X",
                "    . O X .",
            ];
            assert(winner(board) == "X");
        }

        // X wins with left-hand dead end fork
        {
            immutable string[] board = [
                ". . X .",
                " X X . .",
                "  . X X X",
                "   O O O O",
            ];
            assert(winner(board) == "X");
        }

        // X wins with right-hand dead end fork
        {
            immutable string[] board = [
                ". . X X",
                " X X . .",
                "  . X X .",
                "   O O O O",
            ];
            assert(winner(board) == "X");
        }

        // O wins crossing from top to bottom
        {
            immutable string[] board = [
                ". O . .",
                " O X X X",
                "  O O O .",
                "   X X O X",
                "    . O X .",
            ];
            assert(winner(board) == "O");
        }

        // X wins using a convoluted path
        {
            immutable string[] board = [
                ". X X . .",
                " X . X . X",
                "  . X . X .",
                "   . X X . .",
                "    O O O O O",
            ];
            assert(winner(board) == "X");
        }

        // X wins using a spiral path
        {
            immutable string[] board = [
                "O X X X X X X X X",
                " O X O O O O O O O",
                "  O X O X X X X X O",
                "   O X O X O O O X O",
                "    O X O X X X O X O",
                "     O X O O O X O X O",
                "      O X X X X X O X O",
                "       O O O O O O O X O",
                "        X X X X X X X X O",
            ];
            assert(winner(board) == "X");
        }
    }
}
