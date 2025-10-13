module variable_length_quantity;

import std.algorithm.mutation;

pure ubyte[] encode(immutable uint[] integers)
{
    ubyte[] result;
    auto index = integers.length;
    while (index > 0)
    {
        index--;
        uint integer = integers[index];

        result ~= (integer & 0x7f);
        integer >>= 7;
        while (integer != 0)
        {
            result ~= ((integer & 0x7f) | 0x80);
            integer >>= 7;
        }
    }

    result.reverse();
    return result;
}

pure uint[] decode(immutable ubyte[] integers)
{
    uint[] result;
    uint integer;
    bool incomplete = false;
    foreach (data; integers)
    {
        integer = (integer << 7) | (data & 0x7f);
        if ((data & 0x80) == 0)
        {
            result ~= integer;
            integer = 0;
            incomplete = false;
        }
        else
        {
            incomplete = true;
        }
    }
    if (incomplete)
    {
        throw new Exception("incomplete sequence");
    }
    return result;
}
