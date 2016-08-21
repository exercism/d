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
