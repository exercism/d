module food_chain;

import std.array;

pure string recite(int startVerse, int endVerse)
{
    immutable string[] animals = [
        "",
        "fly",
        "spider",
        "bird",
        "cat",
        "dog",
        "goat",
        "cow",
        "horse"
    ];

    immutable string[] exclamations = [
        "",
        "I don't know why she swallowed the fly. Perhaps she'll die.",
        "It wriggled and jiggled and tickled inside her.",
        "How absurd to swallow a bird!",
        "Imagine that, to swallow a cat!",
        "What a hog, to swallow a dog!",
        "Just opened her throat and swallowed a goat!",
        "I don't know how she swallowed a cow!",
        "She's dead, of course!"
    ];

    string[] lyrics;
    for (int verse = startVerse; verse <= endVerse; ++verse)
    {
        if (verse != startVerse)
        {
            lyrics ~= "";
        }

        lyrics ~= "I know an old lady who swallowed a " ~ animals[verse] ~ ".";
        lyrics ~= exclamations[verse];
        if (verse == 1 || verse == 8)
        {
            continue;
        }

        int animal = verse;
        while (animal > 1)
        {
            string line = "She swallowed the " ~ animals[animal];
            --animal;
            line ~= " to catch the " ~ animals[animal];
            if (animal == 2)
            {
                line ~= " that wriggled and jiggled and tickled inside her";
            }
            line ~= ".";

            lyrics ~= line;
        }

        lyrics ~= exclamations[1];
    }

    return lyrics.join("\n");
}
