module perfect_numbers;

import std.exception : enforce;

enum Classification
{
    DEFICIENT,
    PERFECT,
    ABUNDANT
}

pure Classification classify(immutable int input)
{
    enforce(input > 0, "Classification is only possible for natural numbers");

    int aliquot = 0;
    for (int i = 1; i < input; i++)
    {
        if (input % i == 0)
        {
            aliquot += i;
        }
    }

    if (aliquot == input)
    {
        return Classification.PERFECT;
    }
    else if (aliquot > input)
    {
        return Classification.ABUNDANT;
    }
    else
    {
        return Classification.DEFICIENT;
    }
}
