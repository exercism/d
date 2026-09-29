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

        if (win_x && count_o == count_x)
        {
            throw new Exception("Impossible board: O kept playing after X wins");
        }

        if (win_o && count_x > count_o)
        {
            throw new Exception("Impossible board: X kept playing after O wins");
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
