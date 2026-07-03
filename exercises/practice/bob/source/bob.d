module bob;

pure string hey(immutable string text)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Asking a question
    assert(hey("Does this cryogenic chamber make me look fat?") == "Sure.");

    static if (allTestsEnabled)
    {
        // Shouting
        assert(hey("WATCH OUT!") == "Whoa, chill out!");

        // Forceful question
        assert(hey("WHAT'S GOING ON?") == "Calm down, I know what I'm doing!");

        // Silence
        assert(hey("") == "Fine. Be that way!");

        // Stating something
        assert(hey("Tom-ay-to, tom-aaaah-to.") == "Whatever.");

        // Asking a numeric question
        assert(hey("You are, what, like 15?") == "Sure.");

        // Asking gibberish
        assert(hey("fffbbcbeab?") == "Sure.");

        // Question with no letters
        assert(hey("4?") == "Sure.");

        // Non-letters with question
        assert(hey(":) ?") == "Sure.");

        // Prattling on
        assert(hey("Wait! Hang on. Are you going to be OK?") == "Sure.");

        // Ending with whitespace
        assert(hey("Okay if like my  spacebar  quite a bit?   ") == "Sure.");

        // Multiple line question
        assert(hey("\nDoes this cryogenic chamber make\n me look fat?") == "Sure.");

        // Shouting gibberish
        assert(hey("FCECDFCAAB") == "Whoa, chill out!");

        // Shouting a statement containing a question mark
        assert(hey("DO LIONS EAT PEOPLE? AHHHHH.") == "Whoa, chill out!");

        // Shouting numbers
        assert(hey("1, 2, 3 GO!") == "Whoa, chill out!");

        // Shouting with special characters
        assert(hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!") == "Whoa, chill out!");

        // Shouting with no exclamation mark
        assert(hey("I HATE THE DENTIST") == "Whoa, chill out!");

        // Prolonged silence
        assert(hey("          ") == "Fine. Be that way!");

        // Alternate silence
        assert(hey("\t\t\t\t\t\t\t\t\t\t") == "Fine. Be that way!");

        // Other whitespace
        assert(hey("\n\r \t") == "Fine. Be that way!");

        // Talking forcefully
        assert(hey("Hi there!") == "Whatever.");

        // Using acronyms in regular speech
        assert(hey("It's OK if you don't want to go work for NASA.") == "Whatever.");

        // No letters
        assert(hey("1, 2, 3") == "Whatever.");

        // Statement containing question mark
        assert(hey("Ending with ? means a question.") == "Whatever.");

        // Starting with whitespace
        assert(hey("         hmmmmmmm...") == "Whatever.");

        // Non-question ending with whitespace
        assert(hey("This is a statement ending with whitespace      ") == "Whatever.");
    }
}
