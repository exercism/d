module reverse_string;

unittest
{
    const int allTestsEnabled = 0;

    // an empty string
    assert(reverseString("") == "");

    static if (allTestsEnabled)
    {
        // a word
        assert(reverseString("robot") == "tobor");

        // a capitalized word
        assert(reverseString("Ramen") == "nemaR");

        // a sentence with punctuation
        assert(reverseString("I'm hungry!") == "!yrgnuh m'I");

        // a palindrome
        assert(reverseString("racecar") == "racecar");

        // an even-sized word
        assert(reverseString("drawer") == "reward");
    }
}
