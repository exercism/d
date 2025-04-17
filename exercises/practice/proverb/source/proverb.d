module proverb;

pure string recite(immutable string[] strings)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Zero pieces
    {
        string expected = "";
        assert(recite([]) == expected);
    }

    static if (allTestsEnabled)
    {
        // One piece
        {
            string expected = "And all for the want of a nail.";
            assert(recite(["nail"]) == expected);
        }

        // Two pieces
        {
            string expected =   "For want of a nail the shoe was lost.\n"
                              ~ "And all for the want of a nail.";
            assert(recite(["nail", "shoe"]) == expected);
        }

        // Three pieces
        {
            string expected =   "For want of a nail the shoe was lost.\n"
                              ~ "For want of a shoe the horse was lost.\n"
                              ~ "And all for the want of a nail.";
            assert(recite(["nail", "shoe", "horse"]) == expected);
        }

        // Full proverb
        {
            string expected =   "For want of a nail the shoe was lost.\n"
                              ~ "For want of a shoe the horse was lost.\n"
                              ~ "For want of a horse the rider was lost.\n"
                              ~ "For want of a rider the message was lost.\n"
                              ~ "For want of a message the battle was lost.\n"
                              ~ "For want of a battle the kingdom was lost.\n"
                              ~ "And all for the want of a nail.";
            immutable string[] strings = [
                "nail", "shoe", "horse", "rider",
                "message", "battle", "kingdom"
            ];
            assert(recite(strings) == expected);
        }

        // Four pieces modernized
        {
            string expected =  "For want of a pin the gun was lost.\n"
                             ~ "For want of a gun the soldier was lost.\n"
                             ~ "For want of a soldier the battle was lost.\n"
                             ~ "And all for the want of a pin.";
            assert(recite(["pin", "gun", "soldier", "battle"]) == expected);
        }
    }
}
