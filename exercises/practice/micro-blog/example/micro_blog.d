module micro_blog;

import std.algorithm : min;
import std.conv : to;

pure string truncate(immutable string phrase)
{
    dstring str = phrase.to!dstring;
    return str[0..min(5, str.length)].to!string;
}
