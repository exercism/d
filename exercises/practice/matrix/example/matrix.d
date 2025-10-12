module matrix;

pure int[] row(immutable string numbers, size_t index)
{
    return select(numbers, index, 0);
}

pure int[] column(immutable string numbers, size_t index)
{
    return select(numbers, 0, index);
}

pure int[] select(immutable string numbers, size_t requiredRow, size_t requiredColumn)
{
    int[] result;
    size_t currentRow = 1;
    size_t currentColumn = 1;
    int number = 0;
    bool negate = false;
    for (size_t i = 0; i < numbers.length; ++i)
    {
        char c = numbers[i];
        if (c >= '0')
        {
            number = 10 * number + (c - '0');
            if (i + 1 == numbers.length || numbers[i + 1] < '0')
            {
                if (negate)
                {
                    number = -number;
                    negate = false;
                }
                if (currentRow == requiredRow || currentColumn == requiredColumn)
                {
                    result ~= number;
                }
                number = 0;
            }
        }
        if (c == ' ')
        {
            currentColumn += 1;
        }
        if (c == '\n')
        {
            currentRow += 1;
            currentColumn = 1;
        }
        if (c == '-')
        {
            negate = true;
        }
    }
    return result;
}
