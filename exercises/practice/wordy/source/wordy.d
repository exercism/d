module wordy;

pure long answer(immutable string question)
{
    // implement this function
}

unittest
{
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 0;

    // Just a number
    {
        immutable question = "What is 5?";
        assert(answer(question) == 5);
    }

    static if (allTestsEnabled)
    {
        // Just a zero
        {
            immutable question = "What is 0?";
            assert(answer(question) == 0);
        }

        // Just a negative number
        {
            immutable question = "What is -123?";
            assert(answer(question) == -123);
        }

        // Addition
        {
            immutable question = "What is 1 plus 1?";
            assert(answer(question) == 2);
        }

        // Addition with a left hand zero
        {
            immutable question = "What is 0 plus 2?";
            assert(answer(question) == 2);
        }

        // Addition with a right hand zero
        {
            immutable question = "What is 3 plus 0?";
            assert(answer(question) == 3);
        }

        // More addition
        {
            immutable question = "What is 53 plus 2?";
            assert(answer(question) == 55);
        }

        // Addition with negative numbers
        {
            immutable question = "What is -1 plus -10?";
            assert(answer(question) == -11);
        }

        // Large addition
        {
            immutable question = "What is 123 plus 45678?";
            assert(answer(question) == 45801);
        }

        // Subtraction
        {
            immutable question = "What is 4 minus -12?";
            assert(answer(question) == 16);
        }

        // Multiplication
        {
            immutable question = "What is -3 multiplied by 25?";
            assert(answer(question) == -75);
        }

        // Division
        {
            immutable question = "What is 33 divided by -3?";
            assert(answer(question) == -11);
        }

        // Multiple additions
        {
            immutable question = "What is 1 plus 1 plus 1?";
            assert(answer(question) == 3);
        }

        // Addition and subtraction
        {
            immutable question = "What is 1 plus 5 minus -2?";
            assert(answer(question) == 8);
        }

        // Multiple subtraction
        {
            immutable question = "What is 20 minus 4 minus 13?";
            assert(answer(question) == 3);
        }

        // Subtraction then addition
        {
            immutable question = "What is 17 minus 6 plus 3?";
            assert(answer(question) == 14);
        }

        // Multiple multiplication
        {
            immutable question = "What is 2 multiplied by -2 multiplied by 3?";
            assert(answer(question) == -12);
        }

        // Addition and multiplication
        {
            immutable question = "What is -3 plus 7 multiplied by -2?";
            assert(answer(question) == -8);
        }

        // Multiple division
        {
            immutable question = "What is -12 divided by 2 divided by -3?";
            assert(answer(question) == 2);
        }

        // Unknown operation
        {
            immutable question = "What is 52 cubed?";
            assertThrown(answer(question));
        }

        // Non math question
        {
            immutable question = "Who is the President of the United States?";
            assertThrown(answer(question));
        }

        // Reject problem missing an operand
        {
            immutable question = "What is 1 plus?";
            assertThrown(answer(question));
        }

        // Reject problem with no operands or operators
        {
            immutable question = "What is?";
            assertThrown(answer(question));
        }

        // Reject two operations in a row
        {
            immutable question = "What is 1 plus plus 2?";
            assertThrown(answer(question));
        }

        // Reject two numbers in a row
        {
            immutable question = "What is 1 plus 2 1?";
            assertThrown(answer(question));
        }

        // Reject postfix notation
        {
            immutable question = "What is 1 2 plus?";
            assertThrown(answer(question));
        }

        // Reject prefix notation
        {
            immutable question = "What is plus 1 2?";
            assertThrown(answer(question));
        }

        // Large number multiplication and addition
        {
            immutable question = "What is 342668567865 multiplied by 348 plus 6576456942334?";
            assert(answer(question) == 125825118559354L);
        }

        // Large number division and subtraction
        {
            immutable question = "What is 6548074074001254 divided by 654 minus 9876543210001?";
            assert(answer(question) == 135802468900L);
        }
    }
}
