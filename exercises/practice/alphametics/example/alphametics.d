module alphametics;

pure string solve(immutable string puzzle)
{
    struct Letter
    {
        char ch;
        int rank;
        int[] weight;
        bool leading;
        int digit;
    }

    enum int maxRank = int.max;

    Letter[26] table;
    foreach (i; 0 .. 26)
    {
        table[i].ch = cast(char)(i + 'A');
        table[i].rank = maxRank;
    }

    // Scan puzzle right-to-left
    int sign = -1;
    int place = 0;
    int prev = 0;
    for (int i = cast(int) puzzle.length - 1; i >= 0; i--)
    {
        int c = puzzle[i] - 'A';
        if (c >= 0 && c < 26)
        {
            if (place < table[c].rank)
                table[c].rank = place;

            while (table[c].weight.length <= place)
                table[c].weight ~= 0;

            table[c].weight[place] += sign;
            prev = c;
            place++;
        }
        else
        {
            if (puzzle[i] == '=')
                sign = 1;
            if (place > 0)
                table[prev].leading = true;
            place = 0;
        }
    }
    if (place > 0)
        table[prev].leading = true;

    // Compact: collect used letters, sorted by rank
    int nColumns = 0;
    Letter[] letters;
    foreach (i; 0 .. 26)
    {
        if (table[i].rank == maxRank)
            continue;

        if (table[i].weight.length > nColumns)
            nColumns = cast(int) table[i].weight.length;

        // Insertion sort by rank
        size_t j = letters.length;
        letters ~= table[i];
        while (j > 0 && letters[j - 1].rank > table[i].rank)
        {
            letters[j] = letters[j - 1];
            j--;
        }
        letters[j] = table[i];
    }

    // Search: column-by-column backtracking
    bool search(int index, int claimed, int col, int carry)
    {
        if (index == letters.length || letters[index].rank > col)
        {
            int colSum = carry;
            foreach (k; 0 .. index)
            {
                if (col < letters[k].weight.length)
                    colSum += letters[k].weight[col] * letters[k].digit;
            }
            if (colSum % 10 == 0)
            {
                if (col + 1 < nColumns)
                    return search(index, claimed, col + 1, colSum / 10);
                else if (colSum / 10 == 0)
                    return true;
            }
            return false;
        }

        int start = letters[index].leading ? 1 : 0;
        foreach (digit; start .. 10)
        {
            if (claimed & (1 << digit))
                continue;

            letters[index].digit = digit;
            if (search(index + 1, claimed | (1 << digit), col, carry))
                return true;
        }
        return false;
    }

    if (!search(0, 0, 0, 0))
        throw new Exception("no solution");

    // Build result
    char[26] lookup;
    foreach (ref letter; letters)
        lookup[letter.ch - 'A'] = cast(char)(letter.digit + '0');

    char[] result;
    result.length = puzzle.length;
    foreach (i; 0 .. puzzle.length)
    {
        char ch = puzzle[i];
        if (ch >= 'A' && ch <= 'Z')
            result[i] = lookup[ch - 'A'];
        else
            result[i] = ch;
    }
    return cast(string) result;
}
