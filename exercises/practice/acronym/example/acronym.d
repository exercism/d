module acronym;

import std.regex; 
import std.string;

immutable r = regex(r"(?<!_)\B[\w']+|[\W_]");

string abbreviate(immutable string phrase)
{
    return replaceAll(phrase.toUpper(), r, "");
}
