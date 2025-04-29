module food_chain;

pure string recite(int startVerse, int endVerse)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Fly
    {
        string expected =
            "I know an old lady who swallowed a fly.\n" ~
            "I don't know why she swallowed the fly. Perhaps she'll die.";
        assert(recite(1, 1) == expected);
    }

    static if (allTestsEnabled)
    {
        // Spider
        {
            string expected =
                "I know an old lady who swallowed a spider.\n" ~
                "It wriggled and jiggled and tickled inside her.\n" ~
                "She swallowed the spider to catch the fly.\n" ~
                "I don't know why she swallowed the fly. Perhaps she'll die.";
            assert(recite(2, 2) == expected);
        }

        // Bird
        {
            string expected =
                "I know an old lady who swallowed a bird.\n" ~
                "How absurd to swallow a bird!\n" ~
                "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" ~
                "She swallowed the spider to catch the fly.\n" ~
                "I don't know why she swallowed the fly. Perhaps she'll die.";
            assert(recite(3, 3) == expected);
        }

        // Cat
        {
            string expected =
                "I know an old lady who swallowed a cat.\n" ~
                "Imagine that, to swallow a cat!\n" ~
                "She swallowed the cat to catch the bird.\n" ~
                "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" ~
                "She swallowed the spider to catch the fly.\n" ~
                "I don't know why she swallowed the fly. Perhaps she'll die.";
            assert(recite(4, 4) == expected);
        }

        // Dog
        {
            string expected =
                "I know an old lady who swallowed a dog.\n" ~
                "What a hog, to swallow a dog!\n" ~
                "She swallowed the dog to catch the cat.\n" ~
                "She swallowed the cat to catch the bird.\n" ~
                "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" ~
                "She swallowed the spider to catch the fly.\n" ~
                "I don't know why she swallowed the fly. Perhaps she'll die.";
            assert(recite(5, 5) == expected);
        }

        // Goat
        {
            string expected =
                "I know an old lady who swallowed a goat.\n" ~
                "Just opened her throat and swallowed a goat!\n" ~
                "She swallowed the goat to catch the dog.\n" ~
                "She swallowed the dog to catch the cat.\n" ~
                "She swallowed the cat to catch the bird.\n" ~
                "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" ~
                "She swallowed the spider to catch the fly.\n" ~
                "I don't know why she swallowed the fly. Perhaps she'll die.";
            assert(recite(6, 6) == expected);
        }

        // Cow
        {
            string expected =
                "I know an old lady who swallowed a cow.\n" ~
                "I don't know how she swallowed a cow!\n" ~
                "She swallowed the cow to catch the goat.\n" ~
                "She swallowed the goat to catch the dog.\n" ~
                "She swallowed the dog to catch the cat.\n" ~
                "She swallowed the cat to catch the bird.\n" ~
                "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" ~
                "She swallowed the spider to catch the fly.\n" ~
                "I don't know why she swallowed the fly. Perhaps she'll die.";
            assert(recite(7, 7) == expected);
        }

        // Horse
        {
            string expected =
                "I know an old lady who swallowed a horse.\n" ~
                "She's dead, of course!";
            assert(recite(8, 8) == expected);
        }

        // Multiple verses
        {
            string expected =
                "I know an old lady who swallowed a fly.\n" ~
                "I don't know why she swallowed the fly. Perhaps she'll die.\n" ~
                "\n" ~
                "I know an old lady who swallowed a spider.\n" ~
                "It wriggled and jiggled and tickled inside her.\n" ~
                "She swallowed the spider to catch the fly.\n" ~
                "I don't know why she swallowed the fly. Perhaps she'll die.\n" ~
                "\n" ~
                "I know an old lady who swallowed a bird.\n" ~
                "How absurd to swallow a bird!\n" ~
                "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" ~
                "She swallowed the spider to catch the fly.\n" ~
                "I don't know why she swallowed the fly. Perhaps she'll die.";
            assert(recite(1, 3) == expected);
        }

        // Full song
        {
            string expected =
                "I know an old lady who swallowed a fly.\n" ~
                "I don't know why she swallowed the fly. Perhaps she'll die.\n" ~
                "\n" ~
                "I know an old lady who swallowed a spider.\n" ~
                "It wriggled and jiggled and tickled inside her.\n" ~
                "She swallowed the spider to catch the fly.\n" ~
                "I don't know why she swallowed the fly. Perhaps she'll die.\n" ~
                "\n" ~
                "I know an old lady who swallowed a bird.\n" ~
                "How absurd to swallow a bird!\n" ~
                "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" ~
                "She swallowed the spider to catch the fly.\n" ~
                "I don't know why she swallowed the fly. Perhaps she'll die.\n" ~
                "\n" ~
                "I know an old lady who swallowed a cat.\n" ~
                "Imagine that, to swallow a cat!\n" ~
                "She swallowed the cat to catch the bird.\n" ~
                "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" ~
                "She swallowed the spider to catch the fly.\n" ~
                "I don't know why she swallowed the fly. Perhaps she'll die.\n" ~
                "\n" ~
                "I know an old lady who swallowed a dog.\n" ~
                "What a hog, to swallow a dog!\n" ~
                "She swallowed the dog to catch the cat.\n" ~
                "She swallowed the cat to catch the bird.\n" ~
                "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" ~
                "She swallowed the spider to catch the fly.\n" ~
                "I don't know why she swallowed the fly. Perhaps she'll die.\n" ~
                "\n" ~
                "I know an old lady who swallowed a goat.\n" ~
                "Just opened her throat and swallowed a goat!\n" ~
                "She swallowed the goat to catch the dog.\n" ~
                "She swallowed the dog to catch the cat.\n" ~
                "She swallowed the cat to catch the bird.\n" ~
                "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" ~
                "She swallowed the spider to catch the fly.\n" ~
                "I don't know why she swallowed the fly. Perhaps she'll die.\n" ~
                "\n" ~
                "I know an old lady who swallowed a cow.\n" ~
                "I don't know how she swallowed a cow!\n" ~
                "She swallowed the cow to catch the goat.\n" ~
                "She swallowed the goat to catch the dog.\n" ~
                "She swallowed the dog to catch the cat.\n" ~
                "She swallowed the cat to catch the bird.\n" ~
                "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" ~
                "She swallowed the spider to catch the fly.\n" ~
                "I don't know why she swallowed the fly. Perhaps she'll die.\n" ~
                "\n" ~
                "I know an old lady who swallowed a horse.\n" ~
                "She's dead, of course!";
            assert(recite(1, 8) == expected);
        }
    }
}
