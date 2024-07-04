module pig_latin;

string translate(immutable string input)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // word beginning wth a
    assert(translate("apple") == "appleay");

    static if (allTestsEnabled)
    {
        // word beginning with e
        assert(translate("ear") == "earay");

        // word beginning with i
        assert(translate("igloo") == "iglooay");

        // word beginning with o
        assert(translate("object") == "objectay");

        // word beginning with u
        assert(translate("under") == "underay");

        // word beginning with a vowel and followed by a qu
        assert(translate("equal") == "equalay");

        // word beginning with p
        assert(translate("pig") == "igpay");

        // word beginning with k
        assert(translate("koala") == "oalakay");

        // word beginning with x
        assert(translate("xenon") == "enonxay");

        // word beginning with q without a following u
        assert(translate("qat") == "atqay");

        // word beginning with ch
        assert(translate("chair") == "airchay");

        // word beginning with qu
        assert(translate("queen") == "eenquay");

        // word beginning with qu and a preceding consonant
        assert(translate("square") == "aresquay");

        // word beginning with th
        assert(translate("therapy") == "erapythay");

        // word beginning with thr
        assert(translate("thrush") == "ushthray");

        // word beginning with sch
        assert(translate("school") == "oolschay");

        // word beginning with yt
        assert(translate("yttria") == "yttriaay");

        // word beginning with xr
        assert(translate("xray") == "xrayay");

        // y is treated like a consonant at the beginning of a word
        assert(translate("yellow") == "ellowyay");

        // y is treated like a vowel at the end of a consonant cluster
        assert(translate("rhythm") == "ythmrhay");

        // y as second letter in two letter word
        assert(translate("my") == "ymay");

        // a whole phrase
        assert(translate("quick fast run") == "ickquay astfay unray");
    }
}

