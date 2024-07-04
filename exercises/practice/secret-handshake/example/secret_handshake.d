module secret_handshake;

import std.algorithm;

pure string[] commands(immutable int number)
{
    string[] actions;

    if (number & 1)
    {
        actions ~= "wink";
    }

    if (number & 2)
    {
        actions ~= "double blink";
    }

    if (number & 4)
    {
        actions ~= "close your eyes";
    }

    if (number & 8)
    {
        actions ~= "jump";
    }

    if (number & 16)
    {
        actions = actions.reverse;
    }

    return actions;
}

