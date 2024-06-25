module game_of_life;

import std.algorithm : max, min;

pure int[][] tick(immutable int[][] matrix)
{
    int[][] result;
    size_t numRows = matrix.length;
    if (numRows == 0)
    {
        return result;
    }
    size_t numColumns = matrix[0].length;
    result.length = numRows;
    for (size_t row = 0; row < numRows; ++row)
    {
        result[row].length = numColumns;
        for (size_t column = 0; column < numColumns; ++column)
        {
            int previous = matrix[row][column];
            int count = -previous;
            for (size_t r = max(1, row) - 1; r < min(numRows, row + 2); ++r)
            {
                for (size_t c = max(1, column) - 1; c < min(numColumns, column + 2); ++c)
                {
                    count += matrix[r][c];
                }
            }

            if (count == 3 || (count == 2 && previous == 1))
            {
                result[row][column] = 1;
            }
        }
    }
    return result;
}
