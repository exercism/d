module pig_latin;

import std.array : join, split;
import std.regex;

string translate(immutable string input)
{
    string[] results;
    string[] words = input.split(" ");

    auto vowelSound = regex("^([aeiou]|xr|yt)");
    auto consonantSound = regex("^([^aeiou]+(?=y)|[^aeiou]?qu|[^aeiou]+)([a-z]+)");

    foreach (word; words)
    {
        if (!word.matchFirst(vowelSound))
        {
            auto m = word.matchAll(consonantSound);
            word = m.captures[2] ~ m.captures[1];
        }

        results ~= word ~ "ay";
    }
    return results.join(" ");
}

