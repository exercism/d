module allergies;

import std.algorithm;
import std.range;

class Allergies
{
public:
    this(immutable uint score)
    {
        this.score = score;
    }

    final bool allergicTo(immutable string item)
    {
        foreach (allergen; this.list())
        {
            if (item == allergen) {
                return true;
            }
        }
        return false;
    }

    final string[] list()
    {
        return this.allergens.enumerate
                .filter!(item => this.score & (1 << item.index))
                .map!(item => item.value).array();
    }

private:
    immutable uint score;
    string[] allergens = [
        "eggs",
        "peanuts",
        "shellfish",
        "strawberries",
        "tomatoes",
        "chocolate",
        "pollen",
        "cats"
    ];
}