module allergies;

class Allergies
{
    this(immutable uint score)
    {
        // implement this
    }

    final bool allergicTo(immutable string item)
    {
        // implement this
    }

    final string[] list()
    {
        // implement this
    }
}

unittest
{
    immutable int allTestsEnabled = 0;

    // testing for eggs allergy: not allergic to anything
    {
        scope Allergies allergies = new Allergies(0);
        assert(!allergies.allergicTo("eggs"));
    }

    static if (allTestsEnabled)
    {

        // testing for eggs allergy: allergic only to eggs
        {
            scope Allergies allergies = new Allergies(1);
            assert(allergies.allergicTo("eggs"));
        }

        // testing for eggs allergy: allergic to eggs and something else
        {
            scope Allergies allergies = new Allergies(3);
            assert(allergies.allergicTo("eggs"));
        }

        // testing for eggs allergy: allergic to something, but not eggs
        {
            scope Allergies allergies = new Allergies(2);
            assert(!allergies.allergicTo("eggs"));
        }

        // testing for eggs allergy: allergic to everything
        {
            scope Allergies allergies = new Allergies(255);
            assert(allergies.allergicTo("eggs"));
        }

        // testing for peanuts allergy: not allergic to peanuts
        {
            scope Allergies allergies = new Allergies(0);
            assert(!allergies.allergicTo("peanuts"));
        }

        // testing for peanuts allergy: allergic only to peanuts
        {
            scope Allergies allergies = new Allergies(2);
            assert(allergies.allergicTo("peanuts"));
        }

        // testing for peanuts allergy: allergic to peanuts and something else
        {
            scope Allergies allergies = new Allergies(7);
            assert(allergies.allergicTo("peanuts"));
        }

        // testing for peanuts allergy: allergic to something, but not peanuts
        {
            scope Allergies allergies = new Allergies(5);
            assert(!allergies.allergicTo("peanuts"));
        }

        // testing for peanuts allergy: allergic to everything
        {
            scope Allergies allergies = new Allergies(255);
            assert(allergies.allergicTo("peanuts"));
        }

        // testing for shellfish allergy: not allergic to shellfish
        {
            scope Allergies allergies = new Allergies(0);
            assert(!allergies.allergicTo("shellfish"));
        }

        // testing for shellfish allergy: allergic only to shellfish
        {
            scope Allergies allergies = new Allergies(4);
            assert(allergies.allergicTo("shellfish"));
        }

        // testing for shellfish allergy: allergic to shellfish and something else
        {
            scope Allergies allergies = new Allergies(14);
            assert(allergies.allergicTo("shellfish"));
        }

        // testing for shellfish allergy: allergic to something, but not shellfish
        {
            scope Allergies allergies = new Allergies(10);
            assert(!allergies.allergicTo("shellfish"));
        }

        // testing for shellfish allergy: allergic to everything
        {
            scope Allergies allergies = new Allergies(255);
            assert(allergies.allergicTo("shellfish"));
        }

        // testing for eggs allergy: allergic only to eggs
        {
            scope Allergies allergies = new Allergies(1);
            assert(allergies.allergicTo("eggs"));
        }

        // testing for eggs allergy: allergic to eggs and something else
        {
            scope Allergies allergies = new Allergies(3);
            assert(allergies.allergicTo("eggs"));
        }

        // testing for eggs allergy: allergic to something, but not eggs
        {
            scope Allergies allergies = new Allergies(2);
            assert(!allergies.allergicTo("eggs"));
        }

        // testing for eggs allergy: allergic to everything
        {
            scope Allergies allergies = new Allergies(255);
            assert(allergies.allergicTo("eggs"));
        }

        // testing for peanuts allergy: not allergic to peanuts
        {
            scope Allergies allergies = new Allergies(0);
            assert(!allergies.allergicTo("peanuts"));
        }

        // testing for peanuts allergy: allergic only to peanuts
        {
            scope Allergies allergies = new Allergies(2);
            assert(allergies.allergicTo("peanuts"));
        }

        // testing for peanuts allergy: allergic to peanuts and something else
        {
            scope Allergies allergies = new Allergies(7);
            assert(allergies.allergicTo("peanuts"));
        }

        // testing for peanuts allergy: allergic to something, but not peanuts
        {
            scope Allergies allergies = new Allergies(5);
            assert(!allergies.allergicTo("peanuts"));
        }

        // testing for peanuts allergy: allergic to everything
        {
            scope Allergies allergies = new Allergies(255);
            assert(allergies.allergicTo("peanuts"));
        }

        // testing for strawberries allergy: not allergic to strawberries
        {
            scope Allergies allergies = new Allergies(0);
            assert(!allergies.allergicTo("strawberries"));
        }

        // testing for strawberries allergy: allergic only to strawberries
        {
            scope Allergies allergies = new Allergies(8);
            assert(allergies.allergicTo("strawberries"));
        }

        // testing for strawberries allergy: allergic to strawberries and something else
        {
            scope Allergies allergies = new Allergies(28);
            assert(allergies.allergicTo("strawberries"));
        }

        // testing for strawberries allergy: allergic to something, but not strawberries
        {
            scope Allergies allergies = new Allergies(20);
            assert(!allergies.allergicTo("strawberries"));
        }

        // testing for strawberries allergy: allergic to everything
        {
            scope Allergies allergies = new Allergies(255);
            assert(allergies.allergicTo("strawberries"));
        }

        // testing for tomatoes allergy: not allergic to tomatoes
        {
            scope Allergies allergies = new Allergies(0);
            assert(!allergies.allergicTo("tomatoes"));
        }

        // testing for tomatoes allergy: allergic only to tomatoes
        {
            scope Allergies allergies = new Allergies(16);
            assert(allergies.allergicTo("tomatoes"));
        }

        // testing for tomatoes allergy: allergic to tomatoes and something else
        {
            scope Allergies allergies = new Allergies(56);
            assert(allergies.allergicTo("tomatoes"));
        }

        // testing for tomatoes allergy: allergic to something, but not tomatoes
        {
            scope Allergies allergies = new Allergies(40);
            assert(!allergies.allergicTo("tomatoes"));
        }

        // testing for tomatoes allergy: allergic to everything
        {
            scope Allergies allergies = new Allergies(255);
            assert(allergies.allergicTo("tomatoes"));
        }

        // testing for chocolate allergy: not allergic to chocolate
        {
            scope Allergies allergies = new Allergies(0);
            assert(!allergies.allergicTo("chocolate"));
        }

        // testing for chocolate allergy: allergic only to chocolate
        {
            scope Allergies allergies = new Allergies(32);
            assert(allergies.allergicTo("chocolate"));
        }

        // testing for chocolate allergy: allergic to chocolate and something else
        {
            scope Allergies allergies = new Allergies(112);
            assert(allergies.allergicTo("chocolate"));
        }

        // testing for chocolate allergy: allergic to something, but not chocolate
        {
            scope Allergies allergies = new Allergies(80);
            assert(!allergies.allergicTo("chocolate"));
        }

        // testing for chocolate allergy: allergic to everything
        {
            scope Allergies allergies = new Allergies(255);
            assert(allergies.allergicTo("chocolate"));
        }

        // testing for pollen allergy: not allergic to pollen
        {
            scope Allergies allergies = new Allergies(0);
            assert(!allergies.allergicTo("pollen"));
        }

        // testing for pollen allergy: allergic only to pollen
        {
            scope Allergies allergies = new Allergies(64);
            assert(allergies.allergicTo("pollen"));
        }

        // testing for pollen allergy: allergic to pollen and something else
        {
            scope Allergies allergies = new Allergies(224);
            assert(allergies.allergicTo("pollen"));
        }

        // testing for pollen allergy: allergic to something, but not pollen
        {
            scope Allergies allergies = new Allergies(160);
            assert(!allergies.allergicTo("pollen"));
        }

        // testing for pollen allergy: allergic to everything
        {
            scope Allergies allergies = new Allergies(255);
            assert(allergies.allergicTo("pollen"));
        }

        // testing for cats allergy: not allergic to cats
        {
            scope Allergies allergies = new Allergies(0);
            assert(!allergies.allergicTo("cats"));
        }

        // testing for cats allergy: allergic only to cats
        {
            scope Allergies allergies = new Allergies(128);
            assert(allergies.allergicTo("cats"));
        }

        // testing for cats allergy: allergic to cats and something else
        {
            scope Allergies allergies = new Allergies(192);
            assert(allergies.allergicTo("cats"));
        }

        // testing for cats allergy: allergic to something, but not cats
        {
            scope Allergies allergies = new Allergies(64);
            assert(!allergies.allergicTo("cats"));
        }

        // testing for cats allergy: allergic to everything
        {
            scope Allergies allergies = new Allergies(255);
            assert(allergies.allergicTo("cats"));
        }

        // list when: no allergies
        {
            scope Allergies allergies = new Allergies(0);
            string[] result = allergies.list();
            string[] expected = [];
            assert(result == expected);
        }

        // list when: just eggs
        {
            scope Allergies allergies = new Allergies(1);
            string[] result = allergies.list();
            string[] expected = ["eggs"];
            assert(result == expected);
        }

        // list when: just peanuts
        {
            scope Allergies allergies = new Allergies(2);
            string[] result = allergies.list();
            string[] expected = ["peanuts"];
            assert(result == expected);
        }

        // list when: just strawberries
        {
            scope Allergies allergies = new Allergies(8);
            string[] result = allergies.list();
            string[] expected = ["strawberries"];
            assert(result == expected);
        }

        // list when: eggs and peanuts
        {
            scope Allergies allergies = new Allergies(3);
            string[] result = allergies.list();
            string[] expected = ["eggs", "peanuts"];
            assert(result == expected);
        }

        // list when: more than eggs but not peanuts
        {
            scope Allergies allergies = new Allergies(5);
            string[] result = allergies.list();
            string[] expected = ["eggs", "shellfish"];
            assert(result == expected);
        }

        // list when: lots of stuff
        {
            scope Allergies allergies = new Allergies(248);
            string[] result = allergies.list();
            string[] expected = [
                "strawberries",
                "tomatoes",
                "chocolate",
                "pollen",
                "cats"
            ];
            assert(result == expected);
        }

        // list when: everything
        {
            scope Allergies allergies = new Allergies(255);
            string[] result = allergies.list();
            string[] expected = [
                "eggs",
                "peanuts",
                "shellfish",
                "strawberries",
                "tomatoes",
                "chocolate",
                "pollen",
                "cats"
            ];
            assert(result == expected);
        }

        // list when: no allergen score parts
        {
            scope Allergies allergies = new Allergies(509);
            string[] result = allergies.list();
            string[] expected = [
                "eggs",
                "shellfish",
                "strawberries",
                "tomatoes",
                "chocolate",
                "pollen",
                "cats"
            ];
            assert(result == expected);
        }

        // list when: no allergen score parts without highest valid score
        {
            scope Allergies allergies = new Allergies(257);
            string[] result = allergies.list();
            string[] expected = ["eggs"];
            assert(result == expected);
        }
    }

}
