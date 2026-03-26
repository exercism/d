module ocr_numbers;

pure string convert(immutable string[] rows)
{
    if (rows.length % 4 != 0)
        throw new Exception("Number of input lines is not a multiple of four");

    if (rows.length > 0 && rows[0].length % 3 != 0)
        throw new Exception("Number of input columns is not a multiple of three");

    string[] groups;
    for (size_t g = 0; g < rows.length; g += 4)
        groups ~= convertGroup(rows[g .. g + 4]);

    import std.array : join;
    return groups.join(",");
}

private pure string convertGroup(immutable string[] rows)
{
    immutable size_t cols = rows[0].length;
    char[] result;
    for (size_t c = 0; c < cols; c += 3)
        result ~= recognize(rows, c);
    return cast(string) result;
}

private pure char recognize(immutable string[] rows, size_t col)
{
    immutable string[10][4] patterns = [
        [" _ ", "   ", " _ ", " _ ", "   ", " _ ", " _ ", " _ ", " _ ", " _ "],
        ["| |", "  |", " _|", " _|", "|_|", "|_ ", "|_ ", "  |", "|_|", "|_|"],
        ["|_|", "  |", "|_ ", " _|", "  |", " _|", "|_|", "  |", "|_|", " _|"],
        ["   ", "   ", "   ", "   ", "   ", "   ", "   ", "   ", "   ", "   "],
    ];

    foreach (d; 0 .. 10)
    {
        bool match = true;
        foreach (r; 0 .. 4)
        {
            if (rows[r][col .. col + 3] != patterns[r][d])
            {
                match = false;
                break;
            }
        }
        if (match)
            return cast(char)('0' + d);
    }
    return '?';
}
