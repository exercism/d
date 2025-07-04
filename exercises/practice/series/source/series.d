module series;

import std.algorithm.comparison : equal;

unittest
{
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 0;

    // short_digits
    {
        const int[] expected = [0, 1, 2, 3, 4, 5];
        const int[] actual = digits("012345");

        assert(equal(actual, expected));
    }

    static if (allTestsEnabled)
    {
        // long_digits
        {
            const int[] expected = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
            const int[] actual = digits("0123456789");

            assert(equal(actual, expected));
        }

        // keeps_the_digit_order_if_reversed
        {
            const int[] expected = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0];
            const int[] actual = digits("9876543210");

            assert(equal(actual, expected));
        }

        // keeps_arbitrary_digit_order
        {
            const int[] expected = [9, 3, 6, 9, 2, 3, 4, 6, 8];
            const int[] actual = digits("936923468");

            assert(equal(actual, expected));
        }

        // can_slice_by_1
        {
            const int[][] expected = [[0], [1], [2], [3], [4]];
            const int[][] actual = slice("01234", 1);

            assert(equal(actual, expected));
        }

        // Slices of one from one
        {
            const int[][] expected = [[1]];
            const int[][] actual = slice("1", 1);

            assert(equal(actual, expected));
        }

        // Slices of one from two
        {
            const int[][] expected = [[1], [2]];
            const int[][] actual = slice("12", 1);

            assert(equal(actual, expected));
        }

        // Slices of two
        {
            const int[][] expected = [[3, 5]];
            const int[][] actual = slice("35", 2);

            assert(equal(actual, expected));
        }

        // Slices of two overlap
        {
            const int[][] expected = [[9, 1], [1, 4], [4, 2]];
            const int[][] actual = slice("9142", 2);

            assert(equal(actual, expected));
        }

        // Slices can include duplicates
        {
            const int[][] expected = [[7, 7, 7], [7, 7, 7], [7, 7, 7], [7, 7, 7]];
            const int[][] actual = slice("777777", 3);

            assert(equal(actual, expected));
        }

        // Slices of a long series
        {
            const int[][] expected = [[9, 1, 8, 4, 9], [1, 8, 4, 9, 3], [8, 4, 9, 3, 9], [4, 9, 3, 9, 0], [9, 3, 9, 0, 4], [3, 9, 0, 4, 2], [9, 0, 4, 2, 4], [0, 4, 2, 4, 3]];
            const int[][] actual = slice("918493904243", 5);

            assert(equal(actual, expected));
        }

        // Slice length is too large
        {
            assertThrown(slice("12345", 6));
        }

        // Slice length is way too large
        {
            assertThrown(slice("12345", 42));
        }

        // Slice length cannot be zero
        {
            assertThrown(slice("12345", 0));
        }

        // Slice length cannot be negative
        {
            assertThrown(slice("123", -1));
        }

        // Empty series is invalid
        {
            assertThrown(slice("", 1));
        }
    }
}
