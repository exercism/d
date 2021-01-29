module pangram;

import std.uni : toLower;

pure bool isPangram(immutable string str)
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
