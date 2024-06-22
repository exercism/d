module kindergarten_garden;

private pure string plant(dchar c)
{
    switch(c)
    {
        case 'G':
            return "grass";
        case 'C':
            return "clover";
        case 'R':
            return "radishes";
        case 'V':
            return "violets";
        default:
            assert(0);
    }
}

pure string[4] plants(immutable string diagram, immutable string student)
{
    auto first = 2 * (student[0] - 'A');
    auto second = first + 1;
    auto third = (1 + diagram.length) / 2 + first;
    auto fourth = third + 1;
    return [
        plant(diagram[first]),
        plant(diagram[second]),
        plant(diagram[third]),
        plant(diagram[fourth]),
    ];
}
