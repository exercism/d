module two_fer;

import std.format : format;

pure string twoFer(immutable string name = "you")
{
    return "One for %s, one for me.".format(name);
}

unittest
{
    assert(twoFer() == "One for you, one for me.");
    assert(twoFer("Alice") == "One for Alice, one for me.");
    assert(twoFer("Bob") == "One for Bob, one for me.");
}
