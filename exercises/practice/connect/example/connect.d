module connect;

pure string winner(immutable string[] board)
{
    immutable size_t rows = board.length;
    immutable size_t columns = (board[0].length + 1) / 2;
    immutable size_t n = rows * columns;

    size_t[] parents;
    parents.length = n + 4;
    foreach (i; 0 .. n + 4)
        parents[i] = i;

    size_t root(size_t node)
    {
        size_t current = node;
        while (parents[current] != current)
        {
            parents[current] = parents[parents[current]];
            current = parents[current];
        }
        return current;
    }

    char occupant(size_t row, size_t column)
    {
        if (row < rows)
            return board[row][row + 2 * column];
        else if (column < 2)
            return 'O'; // 0 = top, 1 = bottom
        else
            return 'X'; // 2 = left, 3 = right
    }

    void markAdjacent(size_t row1, size_t col1, size_t row2, size_t col2)
    {
        if (occupant(row1, col1) != occupant(row2, col2))
            return;

        immutable size_t root1 = root(row1 * columns + col1);
        immutable size_t root2 = root(row2 * columns + col2);
        parents[root2] = root1;
    }

    // Connect edge virtual nodes
    foreach (j; 0 .. columns)
    {
        markAdjacent(0, j, rows, 0);           // top edge
        markAdjacent(rows - 1, j, rows, 1);    // bottom edge
    }
    foreach (i; 0 .. rows)
    {
        markAdjacent(i, 0, rows, 2);            // left edge
        markAdjacent(i, columns - 1, rows, 3);  // right edge
    }

    // Connect horizontal neighbors
    foreach (i; 0 .. rows)
        foreach (j; 0 .. columns - 1)
            markAdjacent(i, j, i, j + 1);

    // Connect diagonal \ neighbors
    foreach (i; 0 .. rows - 1)
        foreach (j; 0 .. columns)
            markAdjacent(i, j, i + 1, j);

    // Connect diagonal / neighbors
    foreach (i; 0 .. rows - 1)
        foreach (j; 0 .. columns - 1)
            markAdjacent(i, j + 1, i + 1, j);

    if (root(n + 0) == root(n + 1))
        return "O";
    else if (root(n + 2) == root(n + 3))
        return "X";
    else
        return "";
}
