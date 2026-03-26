module palindrome_products;

struct Result {
    int value;
    int[2][] factors;
}

pure Result smallest(int min, int max)
{
    // implement this function
}

pure Result largest(int min, int max)
{
    // implement this function
}

unittest
{
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 0;

    // Find the smallest palindrome from single digit factors
    {
        auto result = smallest(1, 9);
        assert(result.value == 1);
        assert(result.factors == [[1, 1]]);
    }

    static if (allTestsEnabled)
    {
        // Find the largest palindrome from single digit factors
        {
            auto result = largest(1, 9);
            assert(result.value == 9);
            assert(result.factors == [[1, 9], [3, 3]]);
        }

        // Find the smallest palindrome from double digit factors
        {
            auto result = smallest(10, 99);
            assert(result.value == 121);
            assert(result.factors == [[11, 11]]);
        }

        // Find the largest palindrome from double digit factors
        {
            auto result = largest(10, 99);
            assert(result.value == 9009);
            assert(result.factors == [[91, 99]]);
        }

        // Find the smallest palindrome from triple digit factors
        {
            auto result = smallest(100, 999);
            assert(result.value == 10201);
            assert(result.factors == [[101, 101]]);
        }

        // Find the largest palindrome from triple digit factors
        {
            auto result = largest(100, 999);
            assert(result.value == 906609);
            assert(result.factors == [[913, 993]]);
        }

        // Find the smallest palindrome from four digit factors
        {
            auto result = smallest(1000, 9999);
            assert(result.value == 1002001);
            assert(result.factors == [[1001, 1001]]);
        }

        // Find the largest palindrome from four digit factors
        {
            auto result = largest(1000, 9999);
            assert(result.value == 99000099);
            assert(result.factors == [[9901, 9999]]);
        }

        // Empty result for smallest if no palindrome in the range
        {
            auto result = smallest(1002, 1003);
            assert(result.value == 0);
            assert(result.factors.length == 0);
        }

        // Empty result for largest if no palindrome in the range
        {
            auto result = largest(15, 15);
            assert(result.value == 0);
            assert(result.factors.length == 0);
        }

        // Error result for smallest if min is more than max
        assertThrown(smallest(10000, 1));

        // Error result for largest if min is more than max
        assertThrown(largest(2, 1));

        // Smallest product does not use the smallest factor
        {
            auto result = smallest(3215, 4000);
            assert(result.value == 10988901);
            assert(result.factors == [[3297, 3333]]);
        }
    }
}
