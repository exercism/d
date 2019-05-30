module perfect_numbers;

enum Classification
{
    DEFICIENT,
    PERFECT,
    ABUNDANT
}

pure Classification classify(immutable int input)
{
    if (input <= 0)
    {
        throw new Exception("Classification is only possible for natural numbers");
    }

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

unittest
{
    import std.exception : assertThrown;

    assert(classify(6) == Classification.PERFECT);
    assert(classify(28) == Classification.PERFECT);
    assert(classify(33_550_336) == Classification.PERFECT);

    assert(classify(12) == Classification.ABUNDANT);
    assert(classify(30) == Classification.ABUNDANT);
    assert(classify(33_550_335) == Classification.ABUNDANT);

    assert(classify(2) == Classification.DEFICIENT);
    assert(classify(4) == Classification.DEFICIENT);
    assert(classify(32) == Classification.DEFICIENT);
    assert(classify(33_550_337) == Classification.DEFICIENT);
    assert(classify(1) == Classification.DEFICIENT);

    assertThrown(classify(0));
    assertThrown(classify(-1));
}
