module house;

import std.string;

pure string reciteVerse(int verse)
{
    immutable string lyrics =
        "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";

    immutable size_t prefixLength = 8;

    immutable size_t[] table = [ 0, 389, 368, 351, 331, 310, 267, 232, 190, 145, 99, 62, 8 ];

    return lyrics[0 .. prefixLength] ~ lyrics[table[verse] .. lyrics.length];
}

pure string recite(int startVerse, int endVerse)
{
    string result;
    for (int verse = startVerse; verse < endVerse; ++verse)
    {
        result ~= reciteVerse(verse);
        result ~= "\n";
    }
    result ~= reciteVerse(endVerse);
    return result;
}
