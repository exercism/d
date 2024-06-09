module anagram;

pure string[] findAnagrams(immutable string subject, immutable string[] candidates)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // no matches
    {
        immutable string subject = "diaper";
        immutable string[] candidates = ["hello", "world", "zombies", "pants"];
        string[] actual = findAnagrams(subject, candidates);
        string[] expected = [];

        assert(actual == expected);
    }

    static if (allTestsEnabled)
    {
        
        // detects two anagrams
        {
            immutable string subject = "solemn";
            immutable string[] candidates = ["lemons", "cherry", "melons"];
            string[] actual = findAnagrams(subject, candidates);
            string[] expected = ["lemons", "melons"];

            assert(actual == expected);
        }

        // does not detect anagram subsets
        {
            immutable string subject = "good";
            immutable string[] candidates = ["dog", "goody"];
            string[] actual = findAnagrams(subject, candidates);
            string[] expected = [];

            assert(actual == expected);
        }

        // detects anagram
        {
            immutable string subject = "listen";
            immutable string[] candidates = ["enlists", "google", "inlets", "banana"];
            string[] actual = findAnagrams(subject, candidates);
            string[] expected = ["inlets"];

            assert(actual == expected);
        }

        // detects three anagrams
        {
            immutable string subject = "allergy";
            immutable string[] candidates = ["gallery", "ballerina", "regally", "clergy", "largely", "leading"];
            string[] actual = findAnagrams(subject, candidates);
            string[] expected = ["gallery", "regally", "largely"];

            assert(actual == expected);
        }

        // detects multiple anagrams with different case
        {
            immutable string subject = "nose";
            immutable string[] candidates = ["Eons", "ONES"];
            string[] actual = findAnagrams(subject, candidates);
            string[] expected = ["Eons", "ONES"];

            assert(actual == expected);
        }

        // does not detect non-anagrams with identical checksum
        {
            immutable string subject = "mass";
            immutable string[] candidates = ["last"];
            string[] actual = findAnagrams(subject, candidates);
            string[] expected = [];

            assert(actual == expected);
        }

        // detects anagrams case-insensitively
        {
            immutable string subject = "Orchestra";
            immutable string[] candidates = ["cashregister", "Carthorse", "radishes"];
            string[] actual = findAnagrams(subject, candidates);
            string[] expected = ["Carthorse"];

            assert(actual == expected);
        }

        // detects anagrams using case-insensitive subject
        {
            immutable string subject = "Orchestra";
            immutable string[] candidates = ["cashregister", "carthorse", "radishes"];
            string[] actual = findAnagrams(subject, candidates);
            string[] expected = ["carthorse"];

            assert(actual == expected);
        }

        // detects anagrams using case-insensitive possible matches
        {
            immutable string subject = "orchestra";
            immutable string[] candidates = ["cashregister", "Carthorse", "radishes"];
            string[] actual = findAnagrams(subject, candidates);
            string[] expected = ["Carthorse"];

            assert(actual == expected);
        }

        // does not detect an anagram if the original word is repeated
        {
            immutable string subject = "go";
            immutable string[] candidates = ["goGoGO"];
            string[] actual = findAnagrams(subject, candidates);
            string[] expected = [];

            assert(actual == expected);
        }

        // anagrams must use all letters exactly once
        {
            immutable string subject = "tapper";
            immutable string[] candidates = ["patter"];
            string[] actual = findAnagrams(subject, candidates);
            string[] expected = [];

            assert(actual == expected);
        }

        // words are not anagrams of themselves
        {
            immutable string subject = "BANANA";
            immutable string[] candidates = ["BANANA"];
            string[] actual = findAnagrams(subject, candidates);
            string[] expected = [];

            assert(actual == expected);
        }

        // words are not anagrams of themselves even if letter case is partially different
        {
            immutable string subject = "BANANA";
            immutable string[] candidates = ["Banana"];
            string[] actual = findAnagrams(subject, candidates);
            string[] expected = [];

            assert(actual == expected);
        }

        // words are not anagrams of themselves even if letter case is completely different
        {
            immutable string subject = "BANANA";
            immutable string[] candidates = ["banana"];
            string[] actual = findAnagrams(subject, candidates);
            string[] expected = [];

            assert(actual == expected);
        }

        // words other than themselves can be anagrams
        {
            immutable string subject = "LISTEN";
            immutable string[] candidates = ["Listen", "Silent", "LISTEN"];
            string[] actual = findAnagrams(subject, candidates);
            string[] expected = ["Silent"];

            assert(actual == expected);
        }

        // handles case of greek letters
        {
            immutable string subject = "ΑΒΓ";
            immutable string[] candidates = ["ΒΓΑ", "ΒΓΔ", "γβα", "αβγ"];
            string[] actual = findAnagrams(subject, candidates);
            string[] expected = ["ΒΓΑ", "γβα"];

            assert(actual == expected);
        }
    }
}

