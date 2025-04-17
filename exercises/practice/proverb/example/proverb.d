module proverb;

import std.array;

pure string recite(immutable string[] strings)
{
    if (strings.length == 0) return "";
    
    string[] fragments;
    foreach (i, str; strings[0 .. strings.length - 1])
    {
        fragments ~= "For want of a " ~ str ~ " the " ~ strings[i+1] ~ " was lost.";
    }
    
    fragments ~= "And all for the want of a " ~ strings[0] ~ ".";
    
    return fragments.join("\n");
}
