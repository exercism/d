module affine_cipher;

import std.ascii : isAlphaNum, isDigit, toLower;

pure string encode(immutable string phrase, uint a, uint b)
{
    if (!inverses[a])
    {
        throw new Exception("a and m must be coprime.");
    }

    return process(phrase, a, b, 5);
}

pure string decode(immutable string phrase, uint a, uint b)
{
    uint inverse = inverses[a];
    if (!inverse)
    {
        throw new Exception("a and m must be coprime.");
    }

    return process(phrase, inverse, inverse * (26 - (b % 26)), uint.max);
}

pure string process(immutable string phrase, uint a, uint b,  uint chunk)
{
    size_t nextSpace = chunk;
    string result;
    foreach (dchar c; phrase) {
        if (!isAlphaNum(c)) {
            continue;
        }
        if (result.length == nextSpace) {
            result ~= ' ';
            nextSpace += chunk + 1;
        }
        if (!isDigit(c)) {
            c = 'a' + ((toLower(c) - 'a') * a + b) % 26;
        }
        result ~= c;
    }
    return result;
}

private immutable uint[] inverses = [
    0,
    1,
    0,
    9,
    0,
    21,
    0,
    15,
    0,
    3,
    0,
    19,
    0,
    0,
    0,
    7,
    0,
    23,
    0,
    11,
    0,
    5,
    0,
    17,
    0,
    25,
    0
];
