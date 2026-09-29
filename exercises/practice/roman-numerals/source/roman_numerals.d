module roman_numerals;

import std.stdio;

string convert(ulong number)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // 1 is I
    {
        assert("I" == convert(1));
    }

    static if (allTestsEnabled)
    {
        // 2 is II
        {
            assert("II" == convert(2));
        }

        // 3 is III
        {
            assert("III" == convert(3));
        }

        // 4 is IV
        {
            assert("IV" == convert(4));
        }

        // 5 is V
        {
            assert("V" == convert(5));
        }

        // 6 is VI
        {
            assert("VI" == convert(6));
        }

        // 9 is IX
        {
            assert("IX" == convert(9));
        }

        // 16 is XVI
        {
            assert("XVI" == convert(16));
        }

        // 27 is XXVII
        {
            assert("XXVII" == convert(27));
        }

        // 48 is XLVIII
        {
            assert("XLVIII" == convert(48));
        }

        // 49 is XLIX
        {
            assert("XLIX" == convert(49));
        }

        // 59 is LIX
        {
            assert("LIX" == convert(59));
        }

        // 66 is LXVI
        {
            assert("LXVI" == convert(66));
        }

        // 93 is XCIII
        {
            assert("XCIII" == convert(93));
        }

        // 141 is CXLI
        {
            assert("CXLI" == convert(141));
        }

        // 163 is CLXIII
        {
            assert("CLXIII" == convert(163));
        }

        // 166 is CLXVI
        {
            assert("CLXVI" == convert(166));
        }

        // 402 is CDII
        {
            assert("CDII" == convert(402));
        }

        // 575 is DLXXV
        {
            assert("DLXXV" == convert(575));
        }

        // 666 is DCLXVI
        {
            assert("DCLXVI" == convert(666));
        }

        // 911 is CMXI
        {
            assert("CMXI" == convert(911));
        }

        // 1024 is MXXIV
        {
            assert("MXXIV" == convert(1024));
        }

        // 1666 is MDCLXVI
        {
            assert("MDCLXVI" == convert(1666));
        }

        // 3000 is MMM
        {
            assert("MMM" == convert(3000));
        }

        // 3001 is MMMI
        {
            assert("MMMI" == convert(3001));
        }

        // 3888 is MMMDCCCLXXXVIII
        {
            assert("MMMDCCCLXXXVIII" == convert(3888));
        }

        // 3999 is MMMCMXCIX
        {
            assert("MMMCMXCIX" == convert(3999));
        }
    }
}
