import std.stdio;
import std.exception: assertThrown;
import core.exception: AssertError;

import hamming : hamming;

void main() {
    assert(hamming("A", "A") == 0);
    assert(hamming("GGACTGA", "GGACTGA") == 0);

    assert(hamming("A", "G") == 1);
    assert(hamming("AG", "CT") == 2);

    assert(hamming("AT", "CT") == 1);
    assert(hamming("GGACG", "GGTCG") == 1);
    assert(hamming("ACCAGGG", "ACTATGG") == 2);

    assert(hamming("AGA", "AGG") == 1);
    assert(hamming("AGG", "AGA") == 1);

    assert(hamming("GATACA", "GCATAA") == 4);
    assert(hamming("GGACGGATTCTG", "AGGACGGATTCT") == 9);

    assert(hamming("", "") == 0);

    assertThrown!AssertError(hamming("AATG", "AAA"));
    assertThrown!AssertError(hamming("ATA", "AGTG"));

    writeln("All tests passed!");
}
