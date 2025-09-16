module two_bucket;

import std.typecons;

alias TwoBucketInput = Tuple!(
        int, "size1",
        int, "size2",
        int, "goal",
        string, "startBucket",
);

alias TwoBucketResult = Tuple!(
        int, "moves",
        string, "goalBucket",
        int, "otherAmount",
);

pure TwoBucketResult measure(TwoBucketInput input)
{
    // Implement this function
}

unittest
{
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 0;

    // Measure using bucket one of size 3 and bucket two of size 5 - start with bucket one
    {
        auto result = measure(TwoBucketInput(3, 5, 1, "one"));
        assert(result == TwoBucketResult(4, "one", 5));
    }

    static if (allTestsEnabled)
    {
        // Measure using bucket one of size 3 and bucket two of size 5 - start with bucket two
        {
            auto result = measure(TwoBucketInput(3, 5, 1, "two"));
            assert(result == TwoBucketResult(8, "two", 3));
        }

        // Measure using bucket one of size 7 and bucket two of size 11 - start with bucket one
        {
            auto result = measure(TwoBucketInput(7, 11, 2, "one"));
            assert(result == TwoBucketResult(14, "one", 11));
        }

        // Measure using bucket one of size 7 and bucket two of size 11 - start with bucket two
        {
            auto result = measure(TwoBucketInput(7, 11, 2, "two"));
            assert(result == TwoBucketResult(18, "two", 7));
        }

        // Measure one step using bucket one of size 1 and bucket two of size 3 - start with bucket two
        {
            auto result = measure(TwoBucketInput(1, 3, 3, "two"));
            assert(result == TwoBucketResult(1, "two", 0));
        }

        // Measure using bucket one of size 2 and bucket two of size 3 - start with bucket one and end with bucket two
        {
            auto result = measure(TwoBucketInput(2, 3, 3, "one"));
            assert(result == TwoBucketResult(2, "two", 2));
        }

        // Measure using bucket one much bigger than bucket two
        {
            auto result = measure(TwoBucketInput(5, 1, 2, "one"));
            assert(result == TwoBucketResult(6, "one", 1));
        }

        // Measure using bucket one much smaller than bucket two
        {
            auto result = measure(TwoBucketInput(3, 15, 9, "one"));
            assert(result == TwoBucketResult(6, "two", 0));
        }

        // Not possible to reach the goal
        {
            assertThrown(measure(TwoBucketInput(6, 15, 5, "one")));
        }

        // With the same buckets but a different goal, then it is possible
        {
            auto result = measure(TwoBucketInput(6, 15, 9, "one"));
            assert(result == TwoBucketResult(10, "two", 0));
        }

        // Goal larger than both buckets is impossible
        {
            assertThrown(measure(TwoBucketInput(5, 7, 8, "one")));
        }
    }
}
