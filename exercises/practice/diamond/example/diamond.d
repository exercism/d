module diamond;

pure string[] rows(char letter)
{
    immutable int size = letter - 'A';
    immutable int width = 2 * size + 1;
    string[] result;

    foreach (i; 0 .. 2 * size + 1)
    {
        int row = i <= size ? i : 2 * size - i;
        char[] line;
        line.length = width;
        line[] = ' ';
        line[size - row] = cast(char)('A' + row);
        line[size + row] = cast(char)('A' + row);
        result ~= cast(string) line;
    }

    return result;
}
