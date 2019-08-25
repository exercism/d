module pangram;

import std.uni : toLower;

bool isPangram(string str)
{
    bool[dchar] letters;
    foreach (char letter; str)
    {
        auto lower = toLower(letter);
        if (lower >= 'a' && lower <= 'z')
        {
            letters[lower] = true;
        }
    }
    return letters.length == 26;
}
