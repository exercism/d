module zebra_puzzle;

enum Nationality
{
    englishman,
    japanese,
    norwegian,
    spaniard,
    ukranian
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
    ZebraPuzzle zebraPuzzle = new ZebraPuzzle();
    assert(zebraPuzzle.drinksWater() == Nationality.norwegian);
    assert(zebraPuzzle.ownsZebra() == Nationality.japanese);
}
