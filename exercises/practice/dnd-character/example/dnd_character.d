module dnd_character;

import std.algorithm;
import std.random;
import std.range;
import std.math;

class DndCharacter
{
public:
    this()
    {
        this.strength = ability();
        this.dexterity = ability();
        this.constitution = ability();
        this.intelligence = ability();
        this.wisdom = ability();
        this.charisma = ability();
        this.hitpoints = 10 + modifier(this.constitution);
    }

private:
    immutable int strength;
    immutable int dexterity;
    immutable int constitution;
    immutable int intelligence;
    immutable int wisdom;
    immutable int charisma;
    immutable int hitpoints;
}

int ability()
{
    return iota(0, 4).map!((x) => uniform(1, 7)).takeExactly(4).array.sort!("a < b").dropExactly(1).sum();
}

pure int modifier(immutable int value)
{
    return cast(int)floor((value - 10) / 2.0);
}
