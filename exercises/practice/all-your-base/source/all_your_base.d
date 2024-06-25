module all_your_base;

pure int[] rebase(int inputBase, immutable int[] digits, int outputBase)
{
    // implement this function
}

unittest
{
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 0;

    // Single bit one to decimal
    {
        immutable int[] digits = [
            1,
        ];
        int[] expected = [
            1,
        ];
        assert(rebase(2, digits, 10) == expected);
    }

    static if (allTestsEnabled)
    {
        // Binary to single decimal
        {
            immutable int[] digits = [
                1,
                0,
                1,
            ];
            int[] expected = [
                5,
            ];
            assert(rebase(2, digits, 10) == expected);
        }

        // Single decimal to binary
        {
            immutable int[] digits = [
                5,
            ];
            int[] expected = [
                1,
                0,
                1,
            ];
            assert(rebase(10, digits, 2) == expected);
        }

        // Binary to multiple decimal
        {
            immutable int[] digits = [
                1,
                0,
                1,
                0,
                1,
                0,
            ];
            int[] expected = [
                4,
                2,
            ];
            assert(rebase(2, digits, 10) == expected);
        }

        // Decimal to binary
        {
            immutable int[] digits = [
                4,
                2,
            ];
            int[] expected = [
                1,
                0,
                1,
                0,
                1,
                0,
            ];
            assert(rebase(10, digits, 2) == expected);
        }

        // Trinary to hexadecimal
        {
            immutable int[] digits = [
                1,
                1,
                2,
                0,
            ];
            int[] expected = [
                2,
                10,
            ];
            assert(rebase(3, digits, 16) == expected);
        }

        // Hexadecimal to trinary
        {
            immutable int[] digits = [
                2,
                10,
            ];
            int[] expected = [
                1,
                1,
                2,
                0,
            ];
            assert(rebase(16, digits, 3) == expected);
        }

        // 15-bit integer
        {
            immutable int[] digits = [
                3,
                46,
                60,
            ];
            int[] expected = [
                6,
                10,
                45,
            ];
            assert(rebase(97, digits, 73) == expected);
        }

        // Empty list
        {
            immutable int[] digits = [
            ];
            int[] expected = [
                0,
            ];
            assert(rebase(2, digits, 10) == expected);
        }

        // Single zero
        {
            immutable int[] digits = [
                0,
            ];
            int[] expected = [
                0,
            ];
            assert(rebase(10, digits, 2) == expected);
        }

        // Multiple zeros
        {
            immutable int[] digits = [
                0,
                0,
                0,
            ];
            int[] expected = [
                0,
            ];
            assert(rebase(10, digits, 2) == expected);
        }

        // Leading zeros
        {
            immutable int[] digits = [
                0,
                6,
                0,
            ];
            int[] expected = [
                4,
                2,
            ];
            assert(rebase(7, digits, 10) == expected);
        }

        // Input base is one
        {
            immutable int[] digits = [
                0,
            ];
            assertThrown(rebase(1, digits, 10));
        }

        // Input base is zero
        {
            immutable int[] digits = [
            ];
            assertThrown(rebase(0, digits, 10));
        }

        // Input base is negative
        {
            immutable int[] digits = [
                1,
            ];
            assertThrown(rebase(-2, digits, 10));
        }

        // Negative digit
        {
            immutable int[] digits = [
                1,
                -1,
                1,
                0,
                1,
                0,
            ];
            assertThrown(rebase(2, digits, 10));
        }

        // Invalid positive digit
        {
            immutable int[] digits = [
                1,
                2,
                1,
                0,
                1,
                0,
            ];
            assertThrown(rebase(2, digits, 10));
        }

        // Output base is one
        {
            immutable int[] digits = [
                1,
                0,
                1,
                0,
                1,
                0,
            ];
            assertThrown(rebase(2, digits, 1));
        }

        // Output base is zero
        {
            immutable int[] digits = [
                7,
            ];
            assertThrown(rebase(10, digits, 0));
        }

        // Output base is negative
        {
            immutable int[] digits = [
                1,
            ];
            assertThrown(rebase(2, digits, -7));
        }

        // Both bases are negative
        {
            immutable int[] digits = [
                1,
            ];
            assertThrown(rebase(-2, digits, -7));
        }
    }
}
