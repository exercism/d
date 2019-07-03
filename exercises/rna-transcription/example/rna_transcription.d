module rna_transcription;

import std.regex;
import std.string;

immutable dchar[dchar] rnaTransTable;

shared static this() {
 rnaTransTable = [
     'C': 'G',
     'G': 'C',
     'T': 'A',
     'A': 'U'];
}

enum dnaRegex = regex(r"^[CGTA]*$");

string dnaComplement(string dna) {
    import std.exception : enforce;

    enforce(dna.matchFirst(dnaRegex), "Invalid DNA string");
    return dna.translate(rnaTransTable);
}

unittest {
    import std.exception : assertThrown;

    assert(dnaComplement("C") == "G");
    assert(dnaComplement("G") == "C");
    assert(dnaComplement("T") == "A");
    assert(dnaComplement("A") == "U");

    assert(dnaComplement("ACGTGGTCTTAA") == "UGCACCAGAAUU");

    assertThrown(dnaComplement("U"));
    assertThrown(dnaComplement("XXX"));
    assertThrown(dnaComplement("ACGTXXXCTTAA"));
}
