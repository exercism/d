module minesweeper;

import std.algorithm : max, min;

pure string[] annotate(immutable string[] minefield)
{
    string[] result;
    size_t numRows = minefield.length;
    if (numRows == 0)
    {
        return result;
    }
    size_t numColumns = minefield[0].length;
    result.length = numRows;
    for (size_t row = 0; row < numRows; ++row)
    {
        string line;
        for (size_t column = 0; column < numColumns; ++column)
        {
            if (minefield[row][column] == '*')
            {
                line ~= '*';
                continue;
            }
            char count = 0;
            for (size_t r = max(1, row) - 1; r < min(numRows, row + 2); ++r)
            {
                for (size_t c = max(1, column) - 1; c < min(numColumns, column + 2); ++c)
                {
                    if (minefield[r][c] == '*')
                    {
                        ++count;
                    }
                }
            }

            if (count > 0)
            {
                line ~= '0' + count;
            }
            else
            {
                line ~= ' ';
            }
        }
        result[row] = line;
    }
    return result;
}
