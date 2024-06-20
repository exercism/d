module atbash_cipher;

import std.ascii : isAlphaNum, isDigit, toLower;

pure string encode(immutable string phrase)
{
    size_t nextSpace = 5;
    string result;
    foreach (dchar c; phrase) {
        if (!isAlphaNum(c)) {
            continue;
        }
        if (result.length == nextSpace) {
            result ~= ' ';
            nextSpace += 6;
        }
        if (!isDigit(c)) {
            c = 'a' + 'z' - toLower(c);
        }
        result ~= c;
    }
    return result;
}

pure string decode(immutable string phrase)
{
    string result;
    foreach (dchar c; phrase) {
        if (c == ' ') {
            continue;
        }
        if (!isDigit(c)) {
            c = 'a' + 'z' - c;
        }
        result ~= c;
    }
    return result;
}
