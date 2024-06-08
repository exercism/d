module roman_numerals;

import std.stdio;

unittest
{

    immutable int allTestsEnabled = 0;

    // one_yields_I
    {
        writefln("Conversion of 1: %s", convert(1));
        assert("I" == convert(1));
    }

    static if (allTestsEnabled)
    {
        // two_yields_II
        {
            writefln("Conversion of 2: %s", convert(2));
            assert("II" == convert(2));
        }

        // three_yields_III
        {
            writefln("Conversion of 3: %s", convert(3));
            assert("III" == convert(3));
        }

        // four_yields_IV
        {
            writefln("Conversion of 4: %s", convert(4));
            assert("IV" == convert(4));
        }

        // five_yields_V
        {
            writefln("Conversion of 5: %s", convert(5));
            assert("V" == convert(5));
        }

        // six_yields_VI
        {
            writefln("Conversion of 6: %s", convert(6));
            assert("VI" == convert(6));
        }

        // nine_yields_IX
        {
            writefln("Conversion of 9: %s", convert(9));
            assert("IX" == convert(9));
        }

        // sixteen_yields_XVI
        {
            writefln("Conversion of 16: %s", convert(16));
            assert("XVI" == convert(16));
        }

        // twenty_seven_yields_XXVII
        {
            writefln("Conversion of 27: %s", convert(27));
            assert("XXVII" == convert(27));
        }

        // forty_eight_yields_XLVIII
        {
            writefln("Conversion of 48: %s", convert(48));
            assert("XLVIII" == convert(48));
        }

        // forty_nine_yields_XLIX
        {
            writefln("Conversion of 48: %s", convert(49));
            assert("XLIX" == convert(49));
        }

        // fifty_nine_yields_LIX
        {
            writefln("Conversion of 59: %s", convert(59));
            assert("LIX" == convert(59));
        }

        // sixty_six_yields_LXVI
        {
            writefln("Conversion of 66: %s", convert(66));
            assert("LXVI" == convert(66));
        }

        // ninety_three_yields_XCIII
        {
            writefln("Conversion of 93: %s", convert(93));
            assert("XCIII" == convert(93));
        }

        // one_hundred_forty_one_yields_CXLI
        {
            writefln("Conversion of 141: %s", convert(141));
            assert("CXLI" == convert(141));
        }

        // one_hundred_sixty_three_yields_CLXIII
        {
            writefln("Conversion of 163: %s", convert(163));
            assert("CLXIII" == convert(163));
        }

        // one_hundred_sixty_six_yields_CLXVI
        {
            writefln("Conversion of 166: %s", convert(166));
            assert("CLXVI" == convert(166));
        }

        // four_hundred_two_yields_CDII
        {
            writefln("Conversion of 402: %s", convert(402));
            assert("CDII" == convert(402));
        }

        // five_hundred_seventy_five_yields_DLXXV
        {
            writefln("Conversion of 575: %s", convert(575));
            assert("DLXXV" == convert(575));
        }

        // six_hundred_sixty_six_yields_DCLXVI
        {
            writefln("Conversion of 666: %s", convert(666));
            assert("DCLXVI" == convert(666));
        }

        // nine_hundred_eleven_yields_CMXI
        {
            writefln("Conversion of 911: %s", convert(911));
            assert("CMXI" == convert(911));
        }

        // one_thousand_twenty_four_yields_MXXIV
        {
            writefln("Conversion of 1024: %s", convert(1024));
            assert("MXXIV" == convert(1024));
        }

        // one_thousand_six_hundred_sixty_six_yields_MDCLXVI
        {
            writefln("Conversion of 1666: %s", convert(1666));
            assert("MDCLXVI" == convert(1666));
        }

        // three_thousand_yields_MMM
        {
            writefln("Conversion of 3000: %s", convert(3000));
            assert("MMM" == convert(3000));
        }

        // three_thousand_one_yields_MMMI
        {
            writefln("Conversion of 3001: %s", convert(3001));
            assert("MMMI" == convert(3001));
        }

        // three_thousand_eight_hundred_eighty_eight_yields_MMMDCCCLXXXVIII
        {
            writefln("Conversion of 3888: %s", convert(3888));
            assert("MMMDCCCLXXXVIII" == convert(3888));
        }

        // three_thousand_nine_hundred_ninety_nine_yields_MMMCMXCIX
        {
            writefln("Conversion of 3999: %s", convert(3999));
            assert("MMMCMXCIX" == convert(3999));
        }
    }

}
