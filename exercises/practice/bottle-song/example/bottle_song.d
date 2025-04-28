module bottle_song;

import std.array : join;
import std.uni : toLower;

pure string bottles(int numBottles)
{
    return (numBottles == 1) ? "bottle" : "bottles";
}

pure string recite(int startBottles, int takeDown)
{
    immutable string[] number = [ "No", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten" ];

    string[] lyrics;
    int numBottles = startBottles;
    int endBottles = startBottles - takeDown;
    while (numBottles > endBottles)
    {
        string line = number[numBottles] ~ " green " ~ bottles(numBottles) ~ " hanging on the wall,";
        lyrics ~= line;
        lyrics ~= line;
        lyrics ~= "And if one green bottle should accidentally fall,";
        --numBottles;
        lyrics ~= "There'll be " ~ toLower(number[numBottles]) ~ " green " ~ bottles(numBottles) ~ " hanging on the wall.";

        if (numBottles > endBottles)
        {
            lyrics ~= "";
        }
    }

    return lyrics.join("\n");
}
