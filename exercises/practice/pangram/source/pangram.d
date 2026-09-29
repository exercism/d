module pangram;

pure bool isPangram(immutable string str)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // empty sentence
    assert(!isPangram(""));

    static if (allTestsEnabled)
    {
        // perfect lower case
        assert(isPangram("abcdefghijklmnopqrstuvwxyz"));

        // only lower case
        assert(isPangram("the quick brown fox jumps over the lazy dog"));

        // missing the letter 'x'
        assert(!isPangram("a quick movement of the enemy will jeopardize five gunboats"));

        // missing the letter 'h'
        assert(!isPangram("five boxing wizards jump quickly at it"));

        // with underscores
        assert(isPangram("the_quick_brown_fox_jumps_over_the_lazy_dog"));

        // with numbers
        assert(isPangram("the 1 quick brown fox jumps over the 2 lazy dogs"));

        // missing letters replaced by numbers
        assert(!isPangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"));

        // mixed case and punctuation
        assert(isPangram("\"Five quacking Zephyrs jolt my wax bed.\""));

        // a-m and A-M are 26 different characters but not a pangram
        assert(!isPangram("abcdefghijklm ABCDEFGHIJKLM"));

        // upper case and punctuation
        assert(isPangram("\"FIVE QUACKING ZEPHYRS JOLT MY WAX BED.\""));

        // upper case, missing the letter 'x'
        assert(!isPangram("THE QUICK BROWN FISH JUMPS OVER THE LAZY DOG"));
    }
}
