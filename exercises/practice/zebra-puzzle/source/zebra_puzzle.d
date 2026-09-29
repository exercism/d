module zebra_puzzle;

enum Nationality
{
    englishman,
    japanese,
    norwegian,
    spaniard,
    ukrainian
}

class ZebraPuzzle
{
    this()
    {
        // implement this function
    }

    Nationality drinksWater()
    {
        // implement this function
    }

    Nationality ownsZebra()
    {
        // implement this function
    }
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Resident who drinks water
    {
        ZebraPuzzle zebraPuzzle = new ZebraPuzzle();
        assert(zebraPuzzle.drinksWater() == Nationality.norwegian);
    }

    static if (allTestsEnabled)
    {
        // Resident who owns zebra
        {
            ZebraPuzzle zebraPuzzle = new ZebraPuzzle();
            assert(zebraPuzzle.ownsZebra() == Nationality.japanese);
        }
    }
}
