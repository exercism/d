module book_store;

unittest
{
    immutable int allTestsEnabled = 0;

    // Only a single book
    {
        immutable int[] basket = [1];
        assert(total(basket) == 800);
    }

    static if (allTestsEnabled)
    {
        // Two of the same book
        {
            immutable int[] basket = [2, 2];
            assert(total(basket) == 1600);
        }

        // Empty basket
        {
            immutable int[] basket = [];
            assert(total(basket) == 0);
        }

        // Two different books
        {
            immutable int[] basket = [1, 2];
            assert(total(basket) == 1520);
        }

        // Three different books
        {
            immutable int[] basket = [1, 2, 3];
            assert(total(basket) == 2160);
        }

        // Four different books
        {
            immutable int[] basket = [1, 2, 3, 4];
            assert(total(basket) == 2560);
        }

        // Five different books
        {
            immutable int[] basket = [1, 2, 3, 4, 5];
            assert(total(basket) == 3000);
        }

        // Two groups of four is cheaper than group of five plus group of three
        {
            immutable int[] basket = [1, 1, 2, 2, 3, 3, 4, 5];
            assert(total(basket) == 5120);
        }

        // Two groups of four is cheaper than groups of five and three
        {
            immutable int[] basket = [1, 1, 2, 3, 4, 4, 5, 5];
            assert(total(basket) == 5120);
        }

        // Group of four plus group of two is cheaper than two groups of three
        {
            immutable int[] basket = [1, 1, 2, 2, 3, 4];
            assert(total(basket) == 4080);
        }

        // Two each of first four books and one copy each of rest
        {
            immutable int[] basket = [1, 1, 2, 2, 3, 3, 4, 4, 5];
            assert(total(basket) == 5560);
        }

        // Two copies of each book
        {
            immutable int[] basket = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5];
            assert(total(basket) == 6000);
        }

        // Three copies of first book and two each of remaining
        {
            immutable int[] basket = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1];
            assert(total(basket) == 6800);
        }

        // Three each of first two books and two each of remaining books
        {
            immutable int[] basket = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1, 2];
            assert(total(basket) == 7520);
        }

        // Four groups of four are cheaper than two groups each of five and three
        {
            immutable int[] basket = [1, 1, 2, 2, 3, 3, 4, 5, 1, 1, 2, 2, 3, 3, 4, 5];
            assert(total(basket) == 10240);
        }

        // Check that groups of four are created properly even when there are more groups of three than groups of five
        {
            immutable int[] basket = [1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 4, 4, 5, 5];
            assert(total(basket) == 14560);
        }

        // One group of one and four is cheaper than one group of two and three
        {
            immutable int[] basket = [1, 1, 2, 3, 4];
            assert(total(basket) == 3360);
        }

        // One group of one and two plus three groups of four is cheaper than one group of each size
        {
            immutable int[] basket = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5];
            assert(total(basket) == 10000);
        }
    }
}
