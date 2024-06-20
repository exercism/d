module zebra_puzzle;

import std.algorithm.sorting : nextPermutation;

enum Nationality
{
    englishman,
    japanese,
    norwegian,
    spaniard,
    ukranian
}

enum Color
{
    blue,
    green,
    ivory,
    red,
    yellow
}

enum Drink
{
    coffee,
    milk,
    orangeJuice,
    tea,
    water
}

enum Smoke {
    chesterfields,
    kools,
    luckyStrike,
    oldGold,
    parliaments
}

enum Pet
{
    dog,
    fox,
    horse,
    snails,
    zebra
}

int adjacent(int a, int b)
{
    return a == b + 1 || a + 1 == b;
}

class ZebraPuzzle
{
    this()
    {
        int[] nationalities = [0, 1, 2, 3, 4];
        do
        {
            // 10. The Norwegian lives in the first house.
            if (nationalities[Nationality.norwegian] != 0)
                continue;

            int[] colors = [0, 1, 2, 3, 4];
            do
            {
                // 2. The Englishman lives in the red house.
                if (nationalities[Nationality.englishman] != colors[Color.red])
                    continue;

                // 6. The green house is immediately to the right of the ivory house.
                if (colors[Color.green] != colors[Color.ivory] + 1)
                    continue;

                // 15. The Norwegian lives next to the blue house.
                if (!adjacent(nationalities[Nationality.norwegian], colors[Color.blue]))
                    continue;

                int[] drinks = [0, 1, 2, 3, 4];
                do
                {
                    // 4. Coffee is drunk in the green house.
                    if (drinks[Drink.coffee] != colors[Color.green])
                        continue;

                    // 5. The Ukrainian drinks tea.
                    if (nationalities[Nationality.ukranian] != drinks[Drink.tea])
                        continue;

                    // 9. Milk is drunk in the middle house.
                    if (drinks[Drink.milk] != 2)
                        continue;

                    int[] smokes = [0, 1, 2, 3, 4];
                    do
                    {
                        // 8. Kools are smoked in the yellow house.
                        if (smokes[Smoke.kools] != colors[Color.yellow])
                            continue;

                        // 13. The Lucky Strike smoker drinks orange juice.
                        if (smokes[Smoke.luckyStrike] != drinks[Drink.orangeJuice])
                            continue;

                        // 14. The Japanese smokes Parliaments.
                        if (nationalities[Nationality.japanese] != smokes[Smoke.parliaments])
                            continue;

                        int[] pets = [0, 1, 2, 3, 4];
                        do
                        {
                            // 3. The Spaniard owns the dog.
                            if (nationalities[Nationality.spaniard] != pets[Pet.dog])
                                continue;

                            // 7. The Old Gold smoker owns snails.
                            if (smokes[Smoke.oldGold] != pets[Pet.snails])
                                continue;

                            // 11. The man who smokes Chesterfields lives in the house next to the man with the fox.
                            if (!adjacent(smokes[Smoke.chesterfields], pets[Pet.fox]))
                                continue;

                            // 12. Kools are smoked in the house next to the house where the horse is kept.
                            if (!adjacent(smokes[Smoke.kools], pets[Pet.horse]))
                                continue;

                            foreach (nationality; [Nationality.englishman,
                                                   Nationality.japanese,
                                                   Nationality.norwegian,
                                                   Nationality.spaniard,
                                                   Nationality.ukranian])
                            {
                                if (nationalities[nationality] == drinks[Drink.water])
                                    drinksWater_ = nationality;

                                if (nationalities[nationality] == pets[Pet.zebra])
                                    ownsZebra_ = nationality;
                            }
                        } while (nextPermutation(pets));
                    } while (nextPermutation(smokes));
                } while (nextPermutation(drinks));
            } while (nextPermutation(colors));
        } while (nextPermutation(nationalities));
    }

    Nationality drinksWater()
    {
        return drinksWater_;
    }

    Nationality ownsZebra()
    {
        return ownsZebra_;
    }

private:
    Nationality drinksWater_;
    Nationality ownsZebra_;
}
