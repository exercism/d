module rna_transcription;

import std.string : translate;

immutable dchar[dchar] rnaTransTable;

shared static this()
{
    rnaTransTable = ['C': 'G', 'G': 'C', 'T': 'A', 'A': 'U'];
}

pure string toRna(immutable string dna)
{
    return dna.translate(rnaTransTable);
}
