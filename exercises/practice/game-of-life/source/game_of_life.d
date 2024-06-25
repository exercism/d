module game_of_life;

pure int[][] tick(immutable int[][] matrix)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Empty matrix
    {
        immutable int[][] matrix = [
        ];
        int[][] expected = [
        ];
        assert(tick(matrix) == expected);
    }

    static if (allTestsEnabled)
    {
        // Live cells with zero live neighbors die
        {
            immutable int[][] matrix = [
                [0, 0, 0],
                [0, 1, 0],
                [0, 0, 0],
            ];
            int[][] expected = [
                [0, 0, 0],
                [0, 0, 0],
                [0, 0, 0],
            ];
            assert(tick(matrix) == expected);
        }

        // Live cells with only one live neighbor die
        {
            immutable int[][] matrix = [
                [0, 0, 0],
                [0, 1, 0],
                [0, 1, 0],
            ];
            int[][] expected = [
                [0, 0, 0],
                [0, 0, 0],
                [0, 0, 0],
            ];
            assert(tick(matrix) == expected);
        }

        // Live cells with two live neighbors stay alive
        {
            immutable int[][] matrix = [
                [1, 0, 1],
                [1, 0, 1],
                [1, 0, 1],
            ];
            int[][] expected = [
                [0, 0, 0],
                [1, 0, 1],
                [0, 0, 0],
            ];
            assert(tick(matrix) == expected);
        }

        // Live cells with three live neighbors stay alive
        {
            immutable int[][] matrix = [
                [0, 1, 0],
                [1, 0, 0],
                [1, 1, 0],
            ];
            int[][] expected = [
                [0, 0, 0],
                [1, 0, 0],
                [1, 1, 0],
            ];
            assert(tick(matrix) == expected);
        }

        // Dead cells with three live neighbors become alive
        {
            immutable int[][] matrix = [
                [1, 1, 0],
                [0, 0, 0],
                [1, 0, 0],
            ];
            int[][] expected = [
                [0, 0, 0],
                [1, 1, 0],
                [0, 0, 0],
            ];
            assert(tick(matrix) == expected);
        }

        // Live cells with four or more neighbors die
        {
            immutable int[][] matrix = [
                [1, 1, 1],
                [1, 1, 1],
                [1, 1, 1],
            ];
            int[][] expected = [
                [1, 0, 1],
                [0, 0, 0],
                [1, 0, 1],
            ];
            assert(tick(matrix) == expected);
        }

        // Bigger matrix
        {
            immutable int[][] matrix = [
                [1, 1, 0, 1, 1, 0, 0, 0],
                [1, 0, 1, 1, 0, 0, 0, 0],
                [1, 1, 1, 0, 0, 1, 1, 1],
                [0, 0, 0, 0, 0, 1, 1, 0],
                [1, 0, 0, 0, 1, 1, 0, 0],
                [1, 1, 0, 0, 0, 1, 1, 1],
                [0, 0, 1, 0, 1, 0, 0, 1],
                [1, 0, 0, 0, 0, 0, 1, 1],
            ];
            int[][] expected = [
                [1, 1, 0, 1, 1, 0, 0, 0],
                [0, 0, 0, 0, 0, 1, 1, 0],
                [1, 0, 1, 1, 1, 1, 0, 1],
                [1, 0, 0, 0, 0, 0, 0, 1],
                [1, 1, 0, 0, 1, 0, 0, 1],
                [1, 1, 0, 1, 0, 0, 0, 1],
                [1, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 1, 1],
            ];
            assert(tick(matrix) == expected);
        }
    }
}
