module protein_translation;

import std.algorithm;
import std.range;
import std.conv;

immutable string[string] availableProteins = [
    "AUG": "Methionine",
    "UUU": "Phenylalanine",
    "UUC": "Phenylalanine",
    "UUA": "Leucine",
    "UUG": "Leucine",
    "UCU": "Serine",
    "UCC": "Serine",
    "UCA": "Serine",
    "UCG": "Serine",
    "UAU": "Tyrosine",
    "UAC": "Tyrosine",
    "UGU": "Cysteine",
    "UGC": "Cysteine",
    "UGG": "Tryptophan",
    "UAA": "STOP",
    "UAG": "STOP",
    "UGA": "STOP"
];

pure string[] proteins(immutable string strand)
{
    string[] codons = strand.chunks(3).map!(chunk => chunk.array.to!string).array;
    string[] results = [];
    
    foreach (codon; codons) {
        if(codon!in availableProteins)
            throw new Exception("Invalid codon");
 
        string protein = availableProteins[codon];
        if (protein == "STOP")
            return results;
        
        results ~= protein;
    };
 
    return results;
}

