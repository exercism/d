module eliuds_eggs;

pure int eggCount(immutable int number)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // 0 eggs
    assert(eggCount(0) == 0);

    static if (allTestsEnabled)
    {
        // 1 egg
        assert(eggCount(16) == 1);

        // 4 eggs
        assert(eggCount(89) == 4);

        // 13 eggs
        assert(eggCount(2_000_000_000) == 13);
    }

}
