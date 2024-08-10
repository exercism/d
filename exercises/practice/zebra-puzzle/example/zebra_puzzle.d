module zebra_puzzle;

import std.algorithm.sorting : nextPermutation;

enum Nationality
{
    englishman,
    japanese,
    norwegian,
    spaniard,
    ukrainian
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

enum Hobby {
    reading,
    painting,
    football,
    dancing,
    chess
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
                    if (nationalities[Nationality.ukrainian] != drinks[Drink.tea])
                        continue;

                    // 9. Milk is drunk in the middle house.
                    if (drinks[Drink.milk] != 2)
                        continue;

                    int[] hobbies = [0, 1, 2, 3, 4];
                    do
                    {
                        // 8. The person in the yellow house is a painter.
                        if (hobbies[Hobby.painting] != colors[Color.yellow])
                            continue;

                        // 13. The person who plays football drinks orange juice.
                        if (hobbies[Hobby.football] != drinks[Drink.orangeJuice])
                            continue;

                        // 14. The Japanese person plays chess.
                        if (nationalities[Nationality.japanese] != hobbies[Hobby.chess])
                            continue;

                        int[] pets = [0, 1, 2, 3, 4];
                        do
                        {
                            // 3. The Spaniard owns the dog.
                            if (nationalities[Nationality.spaniard] != pets[Pet.dog])
                                continue;

                            // 7. The snail owner likes to go dancing.
                            if (hobbies[Hobby.dancing] != pets[Pet.snails])
                                continue;

                            // 11. The person who enjoys reading lives in the house next to the person with the fox.
                            if (!adjacent(hobbies[Hobby.reading], pets[Pet.fox]))
                                continue;

                            // 12. The painter's house is next to the house with the horse.
                            if (!adjacent(hobbies[Hobby.painting], pets[Pet.horse]))
                                continue;

                            foreach (nationality; [Nationality.englishman,
                                                   Nationality.japanese,
                                                   Nationality.norwegian,
                                                   Nationality.spaniard,
                                                   Nationality.ukrainian])
                            {
                                if (nationalities[nationality] == drinks[Drink.water])
                                    drinksWater_ = nationality;

                                if (nationalities[nationality] == pets[Pet.zebra])
                                    ownsZebra_ = nationality;
                            }
                        } while (nextPermutation(pets));
                    } while (nextPermutation(hobbies));
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
