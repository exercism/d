module change;

pure ushort[] findFewestCoins(immutable ushort[] coins, ushort target)
{
    // implement this function
}

unittest
{
    import std.algorithm.comparison : equal;
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 0;

    // Change for 1 cent
    {
        immutable ushort[] coins = [
            1,
            5,
            10,
            25,
        ];
        ushort[] expected = [
            1,
        ];
        assert(equal(findFewestCoins(coins, 1), expected));
    }

    static if (allTestsEnabled)
    {
        // Single coin change
        {
            immutable ushort[] coins = [
                1,
                5,
                10,
                25,
                100,
            ];
            ushort[] expected = [
                25,
            ];
            assert(equal(findFewestCoins(coins, 25), expected));
        }

        // Multiple coin change
        {
            immutable ushort[] coins = [
                1,
                5,
                10,
                25,
                100,
            ];
            ushort[] expected = [
                5,
                10,
            ];
            assert(equal(findFewestCoins(coins, 15), expected));
        }

        // Change with Lilliputian Coins
        {
            immutable ushort[] coins = [
                1,
                4,
                15,
                20,
                50,
            ];
            ushort[] expected = [
                4,
                4,
                15,
            ];
            assert(equal(findFewestCoins(coins, 23), expected));
        }

        // Change with Lower Elbonia Coins
        {
            immutable ushort[] coins = [
                1,
                5,
                10,
                21,
                25,
            ];
            ushort[] expected = [
                21,
                21,
                21,
            ];
            assert(equal(findFewestCoins(coins, 63), expected));
        }

        // Large target values
        {
            immutable ushort[] coins = [
                1,
                2,
                5,
                10,
                20,
                50,
                100,
            ];
            ushort[] expected = [
                2,
                2,
                5,
                20,
                20,
                50,
                100,
                100,
                100,
                100,
                100,
                100,
                100,
                100,
                100,
            ];
            assert(equal(findFewestCoins(coins, 999), expected));
        }

        // Possible change without unit coins available
        {
            immutable ushort[] coins = [
                2,
                5,
                10,
                20,
                50,
            ];
            ushort[] expected = [
                2,
                2,
                2,
                5,
                10,
            ];
            assert(equal(findFewestCoins(coins, 21), expected));
        }

        // Another possible change without unit coins available
        {
            immutable ushort[] coins = [
                4,
                5,
            ];
            ushort[] expected = [
                4,
                4,
                4,
                5,
                5,
                5,
            ];
            assert(equal(findFewestCoins(coins, 27), expected));
        }

        // A greedy approach is not optimal
        {
            immutable ushort[] coins = [
                1,
                10,
                11,
            ];
            ushort[] expected = [
                10,
                10,
            ];
            assert(equal(findFewestCoins(coins, 20), expected));
        }

        // No coins make 0 change
        {
            immutable ushort[] coins = [
                1,
                5,
                10,
                21,
                25,
            ];
            ushort[] expected = [
            ];
            assert(equal(findFewestCoins(coins, 0), expected));
        }

        // Error testing for change smaller than the smallest of coins
        {
            immutable ushort[] coins = [
                5,
                10,
            ];
            assertThrown(findFewestCoins(coins, 3));
        }

        // Error if no combination can add up to target
        {
            immutable ushort[] coins = [
                5,
                10,
            ];
            assertThrown(findFewestCoins(coins, 94));
        }
    }
}
