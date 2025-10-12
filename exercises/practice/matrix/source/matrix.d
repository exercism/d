module matrix;

pure int[] row(immutable string numbers, size_t index)
{
    // implement this function
}

pure int[] column(immutable string numbers, size_t index)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Extract row from one number matrix
    {
        immutable string numbers = "1";
        int[] expected = [1];
        assert(row(numbers, 1) == expected);
    }

    static if (allTestsEnabled)
    {
        // Can extract row
        {
            immutable string numbers = "1 2\n3 4";
            int[] expected = [3, 4];
            assert(row(numbers, 2) == expected);
        }

        // Extract row where numbers have different widths
        {
            immutable string numbers = "1 2\n10 20";
            int[] expected = [10, 20];
            assert(row(numbers, 2) == expected);
        }

        // Can extract row from non-square matrix with no corresponding column
        {
            immutable string numbers = "1 2 3\n4 5 6\n7 8 9\n8 7 6";
            int[] expected = [8, 7, 6];
            assert(row(numbers, 4) == expected);
        }

        // Extract column from one number matrix
        {
            immutable string numbers = "1";
            int[] expected = [1];
            assert(column(numbers, 1) == expected);
        }

        // Can extract column
        {
            immutable string numbers = "1 2 3\n4 5 6\n7 8 9";
            int[] expected = [3, 6, 9];
            assert(column(numbers, 3) == expected);
        }

        // Can extract column from non-square matrix with no corresponding row
        {
            immutable string numbers = "1 2 3 4\n5 6 7 8\n9 8 7 6";
            int[] expected = [4, 8, 6];
            assert(column(numbers, 4) == expected);
        }

        // Extract column where numbers have different widths
        {
            immutable string numbers = "89 1903 3\n18 3 1\n9 4 800";
            int[] expected = [1903, 3, 4];
            assert(column(numbers, 2) == expected);
        }

        // Row with negative numbers
        {
            immutable string numbers = "1 2 4\n-57 9 -42\n10 0 65";
            int[] expected = [-57, 9, -42];
            assert(row(numbers, 2) == expected);
        }

        // Column with negative numbers
        {
            immutable string numbers = "1 2 -4\n-57 9 -42\n10 0 -465";
            int[] expected = [-4, -42, -465];
            assert(column(numbers, 3) == expected);
        }
    }
}
