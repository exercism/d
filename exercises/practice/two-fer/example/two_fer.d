module two_fer;

import std.format : format;

pure string twoFer(immutable string name = "you")
{
    return "One for %s, one for me.".format(name);
}
