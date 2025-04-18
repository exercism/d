module bottle_song;

pure string recite(int startBottles, int takeDown)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Verse-single verse-first generic verse
    {
        string expected =
            "Ten green bottles hanging on the wall,\n" ~
            "Ten green bottles hanging on the wall,\n" ~
            "And if one green bottle should accidentally fall,\n" ~
            "There'll be nine green bottles hanging on the wall.";
        assert(recite(10, 1) == expected);
    }

    static if (allTestsEnabled)
    {
        // Verse-single verse-last generic verse
        {
            string expected =
                "Three green bottles hanging on the wall,\n" ~
                "Three green bottles hanging on the wall,\n" ~
                "And if one green bottle should accidentally fall,\n" ~
                "There'll be two green bottles hanging on the wall.";
            assert(recite(3, 1) == expected);
        }

        // Verse-single verse-verse with 2 bottles
        {
            string expected =
                "Two green bottles hanging on the wall,\n" ~
                "Two green bottles hanging on the wall,\n" ~
                "And if one green bottle should accidentally fall,\n" ~
                "There'll be one green bottle hanging on the wall.";
            assert(recite(2, 1) == expected);
        }

        // Verse-single verse-verse with 1 bottle
        {
            string expected =
                "One green bottle hanging on the wall,\n" ~
                "One green bottle hanging on the wall,\n" ~
                "And if one green bottle should accidentally fall,\n" ~
                "There'll be no green bottles hanging on the wall.";
            assert(recite(1, 1) == expected);
        }

        // Lyrics-multiple verses-first two verses
        {
            string expected =
                "Ten green bottles hanging on the wall,\n" ~
                "Ten green bottles hanging on the wall,\n" ~
                "And if one green bottle should accidentally fall,\n" ~
                "There'll be nine green bottles hanging on the wall.\n" ~
                "\n" ~
                "Nine green bottles hanging on the wall,\n" ~
                "Nine green bottles hanging on the wall,\n" ~
                "And if one green bottle should accidentally fall,\n" ~
                "There'll be eight green bottles hanging on the wall.";
            assert(recite(10, 2) == expected);
        }

        // Lyrics-multiple verses-last three verses
        {
            string expected =
                "Three green bottles hanging on the wall,\n" ~
                "Three green bottles hanging on the wall,\n" ~
                "And if one green bottle should accidentally fall,\n" ~
                "There'll be two green bottles hanging on the wall.\n" ~
                "\n" ~
                "Two green bottles hanging on the wall,\n" ~
                "Two green bottles hanging on the wall,\n" ~
                "And if one green bottle should accidentally fall,\n" ~
                "There'll be one green bottle hanging on the wall.\n" ~
                "\n" ~
                "One green bottle hanging on the wall,\n" ~
                "One green bottle hanging on the wall,\n" ~
                "And if one green bottle should accidentally fall,\n" ~
                "There'll be no green bottles hanging on the wall.";
            assert(recite(3, 3) == expected);
        }

        // Lyrics-multiple verses-all verses
        {
            string expected =
                "Ten green bottles hanging on the wall,\n" ~
                "Ten green bottles hanging on the wall,\n" ~
                "And if one green bottle should accidentally fall,\n" ~
                "There'll be nine green bottles hanging on the wall.\n" ~
                "\n" ~
                "Nine green bottles hanging on the wall,\n" ~
                "Nine green bottles hanging on the wall,\n" ~
                "And if one green bottle should accidentally fall,\n" ~
                "There'll be eight green bottles hanging on the wall.\n" ~
                "\n" ~
                "Eight green bottles hanging on the wall,\n" ~
                "Eight green bottles hanging on the wall,\n" ~
                "And if one green bottle should accidentally fall,\n" ~
                "There'll be seven green bottles hanging on the wall.\n" ~
                "\n" ~
                "Seven green bottles hanging on the wall,\n" ~
                "Seven green bottles hanging on the wall,\n" ~
                "And if one green bottle should accidentally fall,\n" ~
                "There'll be six green bottles hanging on the wall.\n" ~
                "\n" ~
                "Six green bottles hanging on the wall,\n" ~
                "Six green bottles hanging on the wall,\n" ~
                "And if one green bottle should accidentally fall,\n" ~
                "There'll be five green bottles hanging on the wall.\n" ~
                "\n" ~
                "Five green bottles hanging on the wall,\n" ~
                "Five green bottles hanging on the wall,\n" ~
                "And if one green bottle should accidentally fall,\n" ~
                "There'll be four green bottles hanging on the wall.\n" ~
                "\n" ~
                "Four green bottles hanging on the wall,\n" ~
                "Four green bottles hanging on the wall,\n" ~
                "And if one green bottle should accidentally fall,\n" ~
                "There'll be three green bottles hanging on the wall.\n" ~
                "\n" ~
                "Three green bottles hanging on the wall,\n" ~
                "Three green bottles hanging on the wall,\n" ~
                "And if one green bottle should accidentally fall,\n" ~
                "There'll be two green bottles hanging on the wall.\n" ~
                "\n" ~
                "Two green bottles hanging on the wall,\n" ~
                "Two green bottles hanging on the wall,\n" ~
                "And if one green bottle should accidentally fall,\n" ~
                "There'll be one green bottle hanging on the wall.\n" ~
                "\n" ~
                "One green bottle hanging on the wall,\n" ~
                "One green bottle hanging on the wall,\n" ~
                "And if one green bottle should accidentally fall,\n" ~
                "There'll be no green bottles hanging on the wall.";
            assert(recite(10, 10) == expected);
        }
    }
}
