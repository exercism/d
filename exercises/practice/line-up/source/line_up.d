module line_up;

pure string format(immutable string name, uint number)
{
    // implement this function
}

unittest
{
    import std.algorithm.comparison : equal;
    immutable int allTestsEnabled = 0;

    // Format smallest non-exceptional ordinal numeral 4
    assert(equal("Gianna, you are the 4th customer we serve today. Thank you!",
                 format("Gianna", 4)));

    static if (allTestsEnabled)
    {
        // Format greatest single digit non-exceptional ordinal numeral 9
        assert(equal("Maarten, you are the 9th customer we serve today. Thank you!",
                     format("Maarten", 9)));

        // Format non-exceptional ordinal numeral 5
        assert(equal("Petronila, you are the 5th customer we serve today. Thank you!",
                     format("Petronila", 5)));

        // Format non-exceptional ordinal numeral 6
        assert(equal("Attakullakulla, you are the 6th customer we serve today. Thank you!",
                     format("Attakullakulla", 6)));

        // Format non-exceptional ordinal numeral 7
        assert(equal("Kate, you are the 7th customer we serve today. Thank you!",
                     format("Kate", 7)));

        // Format non-exceptional ordinal numeral 8
        assert(equal("Maximiliano, you are the 8th customer we serve today. Thank you!",
                     format("Maximiliano", 8)));

        // Format exceptional ordinal numeral 1
        assert(equal("Mary, you are the 1st customer we serve today. Thank you!",
                     format("Mary", 1)));

        // Format exceptional ordinal numeral 2
        assert(equal("Haruto, you are the 2nd customer we serve today. Thank you!",
                     format("Haruto", 2)));

        // Format exceptional ordinal numeral 3
        assert(equal("Henriette, you are the 3rd customer we serve today. Thank you!",
                     format("Henriette", 3)));

        // Format smallest two digit non-exceptional ordinal numeral 10
        assert(equal("Alvarez, you are the 10th customer we serve today. Thank you!",
                     format("Alvarez", 10)));

        // Format non-exceptional ordinal numeral 11
        assert(equal("Jacqueline, you are the 11th customer we serve today. Thank you!",
                     format("Jacqueline", 11)));

        // Format non-exceptional ordinal numeral 12
        assert(equal("Juan, you are the 12th customer we serve today. Thank you!",
                     format("Juan", 12)));

        // Format non-exceptional ordinal numeral 13
        assert(equal("Patricia, you are the 13th customer we serve today. Thank you!",
                     format("Patricia", 13)));

        // Format exceptional ordinal numeral 21
        assert(equal("Washi, you are the 21st customer we serve today. Thank you!",
                     format("Washi", 21)));

        // Format exceptional ordinal numeral 62
        assert(equal("Nayra, you are the 62nd customer we serve today. Thank you!",
                     format("Nayra", 62)));

        // Format exceptional ordinal numeral 100
        assert(equal("John, you are the 100th customer we serve today. Thank you!",
                     format("John", 100)));

        // Format exceptional ordinal numeral 101
        assert(equal("Zeinab, you are the 101st customer we serve today. Thank you!",
                     format("Zeinab", 101)));

        // Format non-exceptional ordinal numeral 112
        assert(equal("Knud, you are the 112th customer we serve today. Thank you!",
                     format("Knud", 112)));

        // Format exceptional ordinal numeral 123
        assert(equal("Yma, you are the 123rd customer we serve today. Thank you!",
                     format("Yma", 123)));
    }
}
