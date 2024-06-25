module pythagorean_triplet;

struct Triplet {
    uint a;
    uint b;
    uint c;
}

pure Triplet[] tripletsWithSum(uint n)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Triplets whose sum is 12
    {
        Triplet[] expected = [
            Triplet(3, 4, 5),
        ];
        assert(tripletsWithSum(12) == expected);
    }

    static if (allTestsEnabled)
    {
        // Triplets whose sum is 108
        {
            Triplet[] expected = [
                Triplet(27, 36, 45),
            ];
            assert(tripletsWithSum(108) == expected);
        }

        // Triplets whose sum is 1000
        {
            Triplet[] expected = [
                Triplet(200, 375, 425),
            ];
            assert(tripletsWithSum(1000) == expected);
        }

        // No matching triplets for 1001
        {
            Triplet[] expected = [
            ];
            assert(tripletsWithSum(1001) == expected);
        }

        // Returns all matching triplets
        {
            Triplet[] expected = [
                Triplet(9, 40, 41),
                Triplet(15, 36, 39),
            ];
            assert(tripletsWithSum(90) == expected);
        }

        // Several matching triplets
        {
            Triplet[] expected = [
                Triplet(40, 399, 401),
                Triplet(56, 390, 394),
                Triplet(105, 360, 375),
                Triplet(120, 350, 370),
                Triplet(140, 336, 364),
                Triplet(168, 315, 357),
                Triplet(210, 280, 350),
                Triplet(240, 252, 348),
            ];
            assert(tripletsWithSum(840) == expected);
        }

        // Triplets for large number
        {
            Triplet[] expected = [
                Triplet(1200, 14375, 14425),
                Triplet(1875, 14000, 14125),
                Triplet(5000, 12000, 13000),
                Triplet(6000, 11250, 12750),
                Triplet(7500, 10000, 12500),
            ];
            assert(tripletsWithSum(30000) == expected);
        }
    }
}
