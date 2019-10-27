module leap;

pure bool isLeap(immutable uint year)
{
    pure bool divBy(immutable uint n)
    {
        return year % n == 0;
    }

    return divBy(4) && (!divBy(100) || divBy(400));
}
