module protein_translation;

pure string[] proteins(immutable string rna)
{
    // implement this function
}

unittest
{
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 1;

    // Empty RNA sequence results in no proteins
    assert(proteins("") == []);

    static if (allTestsEnabled)
    {
        // Methionine RNA sequence
        assert(proteins("AUG") == ["Methionine"]);

        // Phenylalanine RNA sequence 1
        assert(proteins("UUU") == ["Phenylalanine"]);

        // Phenylalanine RNA sequence 2
        assert(proteins("UUC") == ["Phenylalanine"]);

        // Leucine RNA sequence 1
        assert(proteins("UUA") == ["Leucine"]);

        // Leucine RNA sequence 2
        assert(proteins("UUG") == ["Leucine"]);

        // Serine RNA sequence 1
        assert(proteins("UCU") == ["Serine"]);

        // Serine RNA sequence 2
        assert(proteins("UCC") == ["Serine"]);

        // Serine RNA sequence 3
        assert(proteins("UCA") == ["Serine"]);

        // Serine RNA sequence 4
        assert(proteins("UCG") == ["Serine"]);

        // Tyrosine RNA sequence 1
        assert(proteins("UAU") == ["Tyrosine"]);

        // Tyrosine RNA sequence 2
        assert(proteins("UAC") == ["Tyrosine"]);

        // Cysteine RNA sequence 1
        assert(proteins("UGU") == ["Cysteine"]);

        // Cysteine RNA sequence 2
        assert(proteins("UGC") == ["Cysteine"]);

        // Tryptophan RNA sequence
        assert(proteins("UGG") == ["Tryptophan"]);

        // STOP codon RNA sequence 1
        assert(proteins("UAA") == []);

        // STOP codon RNA sequence 2
        assert(proteins("UAG") == []);

        // STOP codon RNA sequence 3
        assert(proteins("UGA") == []);

        // Sequence of two protein codons translates into proteins
        assert(proteins("UUUUUU") == ["Phenylalanine", "Phenylalanine"]);

        // Sequence of two different protein codons translates into proteins
        assert(proteins("UUAUUG") == ["Leucine", "Leucine"]);

        // Translate RNA strand into correct protein list
        assert(proteins("AUGUUUUGG") == ["Methionine", "Phenylalanine", "Tryptophan"]);

        // Translation stops if STOP codon at beginning of sequence
        assert(proteins("UAGUGG") == []);

        // Translation stops if STOP codon at end of two-codon sequence
        assert(proteins("UGGUAG") == ["Tryptophan"]);

        // Translation stops if STOP codon at end of three-codon sequence
        assert(proteins("AUGUUUUAA") == ["Methionine", "Phenylalanine"]);

        // Translation stops if STOP codon in middle of three-codon sequence
        assert(proteins("UGGUAGUGG") == ["Tryptophan"]);

        // Translation stops if STOP codon in middle of six-codon sequence
        assert(proteins("UGGUGUUAUUAAUGGUUU") == ["Tryptophan", "Cysteine", "Tyrosine"]);

        // Sequence of two non-STOP codons does not translate to a STOP codon
        assert(proteins("AUGAUG") == ["Methionine", "Methionine"]);

        // Non-existing codon can't translate
        assertThrown(proteins("AAA"));

        // Unknown amino acids, not part of a codon, can't translate
        assertThrown(proteins("XYZ"));

        // Incomplete RNA sequence can't translate
        assertThrown(proteins("AUGU"));

        // Incomplete RNA sequence can translate if valid until a STOP codon
        assert(proteins("UUCUUCUAAUGGU") == ["Phenylalanine", "Phenylalanine"]);
    }
}

