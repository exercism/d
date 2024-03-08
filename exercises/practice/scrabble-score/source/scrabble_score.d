module scrabble_scores;

pure int score(immutable string word)
{
    // Implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Lowercase letter
    assert(score("a") == 1);

    static if (allTestsEnabled)
    {
        // Uppercase letter
        assert(score("A") == 1);

        // Valuable letter
        assert(score("f") == 4);
        
        // Short word
        assert(score("at") == 2);
        
        // Short, valuable word
        assert(score("zoo") == 12);
        
        // Medium word
        assert(score("street") == 6);
        
        // Medium, valuable word
        assert(score("quirky") == 22);
        
        // Long, mixed-case word
        assert(score("OxyphenButazone") == 41);
        
        // English-like word
        assert(score("pinata") == 8);
        
        // Empty input
        assert(score("") == 0);
        
        // Entire alphabet available
        assert(score("abcdefghijklmnopqrstuvwxyz") == 87);
    }
}
