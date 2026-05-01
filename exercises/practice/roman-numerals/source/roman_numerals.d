module roman_numerals;

import std.stdio;

string convert(ulong number)
{
    // implement this function
}

unittest
{

    immutable int allTestsEnabled = 0;

    // one_yields_I
    {
        assert("I" == convert(1));
    }

    static if (allTestsEnabled)
    {
        // two_yields_II
        {
            assert("II" == convert(2));
        }

        // three_yields_III
        {
            assert("III" == convert(3));
        }

        // four_yields_IV
        {
            assert("IV" == convert(4));
        }

        // five_yields_V
        {
            assert("V" == convert(5));
        }

        // six_yields_VI
        {
            assert("VI" == convert(6));
        }

        // nine_yields_IX
        {
            assert("IX" == convert(9));
        }

        // sixteen_yields_XVI
        {
            assert("XVI" == convert(16));
        }

        // twenty_seven_yields_XXVII
        {
            assert("XXVII" == convert(27));
        }

        // forty_eight_yields_XLVIII
        {
            assert("XLVIII" == convert(48));
        }

        // forty_nine_yields_XLIX
        {
            assert("XLIX" == convert(49));
        }

        // fifty_nine_yields_LIX
        {
            assert("LIX" == convert(59));
        }

        // sixty_six_yields_LXVI
        {
            assert("LXVI" == convert(66));
        }

        // ninety_three_yields_XCIII
        {
            assert("XCIII" == convert(93));
        }

        // one_hundred_forty_one_yields_CXLI
        {
            assert("CXLI" == convert(141));
        }

        // one_hundred_sixty_three_yields_CLXIII
        {
            assert("CLXIII" == convert(163));
        }

        // one_hundred_sixty_six_yields_CLXVI
        {
            assert("CLXVI" == convert(166));
        }

        // four_hundred_two_yields_CDII
        {
            assert("CDII" == convert(402));
        }

        // five_hundred_seventy_five_yields_DLXXV
        {
            assert("DLXXV" == convert(575));
        }

        // six_hundred_sixty_six_yields_DCLXVI
        {
            assert("DCLXVI" == convert(666));
        }

        // nine_hundred_eleven_yields_CMXI
        {
            assert("CMXI" == convert(911));
        }

        // one_thousand_twenty_four_yields_MXXIV
        {
            assert("MXXIV" == convert(1024));
        }

        // one_thousand_six_hundred_sixty_six_yields_MDCLXVI
        {
            assert("MDCLXVI" == convert(1666));
        }

        // three_thousand_yields_MMM
        {
            assert("MMM" == convert(3000));
        }

        // three_thousand_one_yields_MMMI
        {
            assert("MMMI" == convert(3001));
        }

        // three_thousand_eight_hundred_eighty_eight_yields_MMMDCCCLXXXVIII
        {
            assert("MMMDCCCLXXXVIII" == convert(3888));
        }

        // three_thousand_nine_hundred_ninety_nine_yields_MMMCMXCIX
        {
            assert("MMMCMXCIX" == convert(3999));
        }
    }

}
