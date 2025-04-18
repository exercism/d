module twelve_days;

import std.array;

pure string recite(int startVerse, int endVerse)
{
    immutable string[] ordinals = [ "", "first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth" ];

    immutable string gifts =
        "twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.";

    immutable size_t[] table = [ 0, 235, 213, 194, 174, 157, 137, 113, 90, 69, 48, 26, 0 ];

    string[] lyrics;
    for (int verse = startVerse; verse <= endVerse; ++verse)
    {
        lyrics ~= "On the " ~ ordinals[verse] ~ " day of Christmas my true love gave to me: " ~ gifts[table[verse] .. gifts.length];
    }

    return lyrics.join("\n");
}
