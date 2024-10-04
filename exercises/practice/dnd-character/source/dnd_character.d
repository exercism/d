module dnd_character;

class DndCharacter
{
    this()
    {
        // implement this function
    }
}

int ability()
{
    // implement this function
}

pure int modifier(immutable int value)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Ability modifier for score 3 is -4
    assert(modifier(3) == -4);

    static if (allTestsEnabled)
    {
        // Ability modifier for score 4 is -3
        assert(modifier(4) == -3);

        // Ability modifier for score 5 is -3
        assert(modifier(5) == -3);

        // Ability modifier for score 6 is -2
        assert(modifier(6) == -2);

        // Ability modifier for score 7 is -2
        assert(modifier(7) == -2);

        // Ability modifier for score 8 is -1
        assert(modifier(8) == -1);

        // Ability modifier for score 9 is -1
        assert(modifier(9) == -1);

        // Ability modifier for score 10 is 0
        assert(modifier(10) == 0);

        // Ability modifier for score 11 is 0
        assert(modifier(11) == 0);

        // Ability modifier for score 12 is +1
        assert(modifier(12) == 1);

        // Ability modifier for score 13 is +1
        assert(modifier(13) == 1);

        // Ability modifier for score 14 is +2
        assert(modifier(14) == 2);

        // Ability modifier for score 15 is +2
        assert(modifier(15) == 2);

        // Ability modifier for score 16 is +3
        assert(modifier(16) == 3);

        // Ability modifier for score 17 is +3
        assert(modifier(17) == 3);

        // Ability modifier for score 18 is +4
        assert(modifier(18) == 4);

        // Random ability is within range
        {
            int score = ability();
            assert(score >= 3 && score <= 18);
        }

        // Random character is valid
        {
            import std.range : iota;
            import std.algorithm : canFind;

            DndCharacter character = new DndCharacter();
            assert(iota(3, 19).canFind(character.strength));
            assert(iota(3, 19).canFind(character.dexterity));
            assert(iota(3, 19).canFind(character.constitution));
            assert(iota(3, 19).canFind(character.intelligence));
            assert(iota(3, 19).canFind(character.wisdom));
            assert(iota(3, 19).canFind(character.charisma));
            assert(character.hitpoints == (10 + modifier(character.constitution)));
        }

        // Each ability is only calculated once
        {
            DndCharacter character = new DndCharacter();
            assert(character.strength == character.strength);
            assert(character.dexterity == character.dexterity);
            assert(character.constitution == character.constitution);
            assert(character.intelligence == character.intelligence);
            assert(character.wisdom == character.wisdom);
            assert(character.charisma == character.charisma);
        }

        // Character is randomly generated (track-specific)
        {
            DndCharacter previous = new DndCharacter();
            bool isSame = false;
            for (int i = 1; i <= 1000; i++)
            {
                DndCharacter current = new DndCharacter();
                
                isSame = current.strength == previous.strength &&
                        current.dexterity == previous.dexterity &&
                        current.constitution == previous.constitution &&
                        current.intelligence == previous.intelligence &&
                        current.wisdom == previous.wisdom &&
                        current.charisma == previous.charisma;
                if(isSame)
                {
                    break;
                }

                previous = current;
            }

            assert(isSame == false);
        }
    }
}
