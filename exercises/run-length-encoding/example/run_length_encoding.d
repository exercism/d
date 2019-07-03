module run_length_encoding;

import std.algorithm : group;
import std.array : array, join, empty, replicate;
import std.algorithm.iteration : map;
import std.format : format;
import std.conv : to;

pure string encode(immutable string input)
{
    string result;
    auto grouping = input.array.group;
    foreach (immutable dchar letter, immutable uint count; grouping)
    {
        if (count > 1)
        {
            result ~= "%d%s".format(count, letter);
        }
        else
        {
            result ~= letter;
        }
    }
    return result;
}

pure string decode(immutable string input)
{
    string i, result;

    foreach (immutable c; input) switch (c)
    {
    case '0': .. case '9':
        i ~= c;
        break;
    default:
        if (i.empty)
        {
            result ~= c;
        }
        else
        {
            result ~= [c].replicate(i.to!int);
            i.length = 0;
        }
        break;
    }

    return result;
}

unittest
{
    assert(encode("") == "");
    assert(encode("XYZ") == "XYZ");
    assert(encode("AABBBCCCC") == "2A3B4C");
    assert(encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB") == "12WB12W3B24WB");
    assert(encode("  hsqq qww  ") == "2 hs2q q2w2 ");
    assert(encode("aabbbcccc") == "2a3b4c");

    assert(decode("") == "");
    assert(decode("XYZ") == "XYZ");
    assert(decode("2A3B4C") == "AABBBCCCC");
    assert(decode("12WB12W3B24WB") == "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB");
    assert(decode("2 hs2q q2w2 ") == "  hsqq qww  ");
    assert(decode("2a3b4c") == "aabbbcccc");

    assert("zzz ZZ  zZ".encode.decode == "zzz ZZ  zZ");
}
