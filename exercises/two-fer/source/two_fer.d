module two_fer;

unittest
{
    immutable int allTestsEnabled = 0;

    // no name given
    assert(twoFer() == "One for you, one for me.");

    static if (allTestsEnabled)
    {
        // a name given
        assert(twoFer("Alice") == "One for Alice, one for me.");

        // another name given
        assert(twoFer("Bob") == "One for Bob, one for me.");
    }

}
