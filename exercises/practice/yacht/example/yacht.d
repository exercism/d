module yacht;

import std.algorithm;
import std.array;

enum Category
{
    ones,
    twos,
    threes,
    fours,
    fives,
    sixes,
    fullHouse,
    fourOfAKind,
    littleStraight,
    bigStraight,
    choice,
    yacht
}

pure int[int] counts(immutable int[] dice)
{
    int[int] results;
    foreach (die; dice)
    {
        results[die]++;
    }

    return results;
}

int score(immutable int[] dice, Category category)
{
    switch (category)
    {
    case Category.ones:
        return dice.filter!(x => x == 1).sum;
    case Category.twos:
        return dice.filter!(x => x == 2).sum;
    case Category.threes:
        return dice.filter!(x => x == 3).sum;
    case Category.fours:
        return dice.filter!(x => x == 4).sum;
    case Category.fives:
        return dice.filter!(x => x == 5).sum;
    case Category.sixes:
        return dice.filter!(x => x == 6).sum;
    case Category.fullHouse:
        int[int] counter = counts(dice);
        return counter.values.array.sort().array == [2, 3] ? dice.sum : 0;
    case Category.fourOfAKind:
        int[int] counter = counts(dice);
        auto kvp = counter.byKeyValue.maxElement!(kv => kv.value);
        return kvp.value >= 4 ? kvp.key * 4 : 0;
    case Category.littleStraight:
        return dice.dup.sort().array == [1, 2, 3, 4, 5] ? 30 : 0;
    case Category.bigStraight:
        return dice.dup.sort().array == [2, 3, 4, 5, 6] ? 30 : 0;
    case Category.choice:
        return dice.sum;
    case Category.yacht:
        int[int] counter = counts(dice);
        return counter.values.array.maxElement == 5 ? 50 : 0;
    default:
        return 0;
    }
}

