import std;

pure string rotate(immutable string text, immutable int shiftKey)
{
    string result = "";
    foreach (immutable char chr; text)
    {
        if (std.ascii.isLower(chr))
        {
            result ~= 'a' + (chr - 'a' + shiftKey) % 26;
        }
        else if (std.ascii.isUpper(chr))
        {
            result ~= 'A' + (chr - 'A' + shiftKey) % 26;
        }
        else
        {
            result ~= chr;
        }
    }

    return result;
}
