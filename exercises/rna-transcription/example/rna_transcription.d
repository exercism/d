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
