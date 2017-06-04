module rna_transcription;

import std.exception : assertThrown;

unittest {
const int allTestsEnabled = 0;

    assert(dnaComplement("C") == "G");
static if (allTestsEnabled) {
    assert(dnaComplement("G") == "C");
    assert(dnaComplement("T") == "A");
    assert(dnaComplement("A") == "U");

    assert(dnaComplement("ACGTGGTCTTAA") == "UGCACCAGAAUU");

    assertThrown(dnaComplement("U"));
    assertThrown(dnaComplement("XXX"));
    assertThrown(dnaComplement("ACGTXXXCTTAA"));
}

}
