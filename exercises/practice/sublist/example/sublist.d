module sublist;

enum Relation
{
    equal,
    sublist,
    superlist,
    unequal
}

pure Relation compare(T)(immutable T[] listOne, immutable T[] listTwo)
{
    if (isSublist(listOne, listTwo))
    {
        if (isSublist(listTwo, listOne))
        {
            return Relation.equal;
        }
        return Relation.sublist;
    }
    if (isSublist(listTwo, listOne))
    {
        return Relation.superlist;
    }
    return Relation.unequal;
}

pure bool isSublist(T)(immutable T[] listOne, immutable T[] listTwo)
{
    search: for (size_t i = listOne.length; i <= listTwo.length; ++i)
    {
        for (size_t j = 0; j < listOne.length; ++j)
        {
            if (listOne[j] != listTwo[i - listOne.length + j])
            {
                continue search;
            }
        }
        return true;
    }
    return false;
}
