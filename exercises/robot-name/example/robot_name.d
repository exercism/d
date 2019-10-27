module robot;

import std.string;
import std.ascii : uppercase, digits;
import std.regex;
import std.random;

import std.stdio;

class Robot
{
public:
    this()
    {
        initName();
    }

    string name() const @property
    {
        return name_;
    }

    void reset()
    {
        string oldName = name_;
        // intialize a new name
        initName();
        // free the old name in the dictionary
        nameDictionary[oldName] = false;
    }

    static uint collisons() @property
    {
        return collisions_;
    }

private:
    void initName()
    {
        string newName = generateName();
        while (newName in nameDictionary && nameDictionary[newName] == true)
        {
            ++collisions_;
            newName = generateName();
        }

        nameDictionary[newName] = true;
        name_ = newName;
    }

    string generateName()
    {
        char[] upper = uppercase.dup;
        char[] dig = digits.dup;
        randomShuffle(upper.representation);
        randomShuffle(dig.representation);

        string n = "".dup;
        auto gen = Random(unpredictableSeed);
        auto idx = uniform(0, upper.length, gen);
        n ~= upper[idx];
        idx = uniform(0, upper.length, gen);
        n ~= upper[idx];

        foreach (i; [0, 1, 2])
        {
            idx = uniform(0, dig.length, gen);
            n ~= dig[idx];
        }

        return n;
    }

    string name_;

    // !! that causes a segmentation fault !!
    //static char[] upper = uppercase.dup;
    //static char[] dig = digits.dup;

    static bool[string] nameDictionary;
    static uint collisions_ = 0;
}
