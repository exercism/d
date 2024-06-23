module kindergarten_garden;

pure string[4] plants(immutable string diagram, immutable string student)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Partial garden with single student
    {
        immutable string diagram = "RC\nGG";
        string[4] expected = [
            "radishes",
            "clover",
            "grass",
            "grass",
        ];
        assert(plants(diagram, "Alice") == expected);
    }

    static if (allTestsEnabled)
    {
        // Partial garden-different garden with single student
        {
            immutable string diagram = "VC\nRC";
            string[4] expected = [
                "violets",
                "clover",
                "radishes",
                "clover",
            ];
            assert(plants(diagram, "Alice") == expected);
        }

        // Partial garden with two students
        {
            immutable string diagram = "VVCG\nVVRC";
            string[4] expected = [
                "clover",
                "grass",
                "radishes",
                "clover",
            ];
            assert(plants(diagram, "Bob") == expected);
        }

        // Partial garden-multiple students for the same garden with three
        // students-second student's garden
        {
            immutable string diagram = "VVCCGG\nVVCCGG";
            string[4] expected = [
                "clover",
                "clover",
                "clover",
                "clover",
            ];
            assert(plants(diagram, "Bob") == expected);
        }

        // Partial garden-multiple students for the same garden with three
        // students-third student's garden
        {
            immutable string diagram = "VVCCGG\nVVCCGG";
            string[4] expected = [
                "grass",
                "grass",
                "grass",
                "grass",
            ];
            assert(plants(diagram, "Charlie") == expected);
        }

        // Full garden-for Alice, first student's garden
        {
            immutable string diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV";
            string[4] expected = [
                "violets",
                "radishes",
                "violets",
                "radishes",
            ];
            assert(plants(diagram, "Alice") == expected);
        }

        // Full garden-for Bob, second student's garden
        {
            immutable string diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV";
            string[4] expected = [
                "clover",
                "grass",
                "clover",
                "clover",
            ];
            assert(plants(diagram, "Bob") == expected);
        }

        // Full garden-for Charlie
        {
            immutable string diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV";
            string[4] expected = [
                "violets",
                "violets",
                "clover",
                "grass",
            ];
            assert(plants(diagram, "Charlie") == expected);
        }

        // Full garden-for David
        {
            immutable string diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV";
            string[4] expected = [
                "radishes",
                "violets",
                "clover",
                "radishes",
            ];
            assert(plants(diagram, "David") == expected);
        }

        // Full garden-for Eve
        {
            immutable string diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV";
            string[4] expected = [
                "clover",
                "grass",
                "radishes",
                "grass",
            ];
            assert(plants(diagram, "Eve") == expected);
        }

        // Full garden-for Fred
        {
            immutable string diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV";
            string[4] expected = [
                "grass",
                "clover",
                "violets",
                "clover",
            ];
            assert(plants(diagram, "Fred") == expected);
        }

        // Full garden-for Ginny
        {
            immutable string diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV";
            string[4] expected = [
                "clover",
                "grass",
                "grass",
                "clover",
            ];
            assert(plants(diagram, "Ginny") == expected);
        }

        // Full garden-for Harriet
        {
            immutable string diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV";
            string[4] expected = [
                "violets",
                "radishes",
                "radishes",
                "violets",
            ];
            assert(plants(diagram, "Harriet") == expected);
        }

        // Full garden-for Ileana
        {
            immutable string diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV";
            string[4] expected = [
                "grass",
                "clover",
                "violets",
                "clover",
            ];
            assert(plants(diagram, "Ileana") == expected);
        }

        // Full garden-for Joseph
        {
            immutable string diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV";
            string[4] expected = [
                "violets",
                "clover",
                "violets",
                "grass",
            ];
            assert(plants(diagram, "Joseph") == expected);
        }

        // Full garden-for Kincaid, second to last student's garden
        {
            immutable string diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV";
            string[4] expected = [
                "grass",
                "clover",
                "clover",
                "grass",
            ];
            assert(plants(diagram, "Kincaid") == expected);
        }

        // Full garden-for Larry, last student's garden
        {
            immutable string diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV";
            string[4] expected = [
                "grass",
                "violets",
                "clover",
                "violets",
            ];
            assert(plants(diagram, "Larry") == expected);
        }
    }
}
