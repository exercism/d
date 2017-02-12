module rna_transcription;

import std.exception;
import std.regex;
import std.string;

immutable dchar[dchar] rnaTransTable;

static this() {
 rnaTransTable = [
     'C': 'G',
     'G': 'C',
     'T': 'A',
     'A': 'U'];
}

enum dnaRegex = regex(r"^[CGTA]*$");

string dnaComplement(string dna) {
    enforce(dna.matchFirst(dnaRegex), "Invalid DNA string");
    return dna.translate(rnaTransTable);
}

unittest {
    assert(dnaComplement("C") == "G");
    assert(dnaComplement("G") == "C");
    assert(dnaComplement("T") == "A");
    assert(dnaComplement("A") == "U");

    assert(dnaComplement("ACGTGGTCTTAA") == "UGCACCAGAAUU");

    assertThrown(dnaComplement("U"));
    assertThrown(dnaComplement("XXX"));
    assertThrown(dnaComplement("ACGTXXXCTTAA"));
}

void main () {}
