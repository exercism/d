# Nucleotide Count

Given a DNA string, compute how many times each nucleotide occurs in the string.

DNA is represented by an alphabet of the following symbols: 'A', 'C',
'G', and 'T'.

Each symbol represents a nucleotide, which is a fancy name for the
particular molecules that happen to make up a large part of DNA.

Shortest intro to biochemistry EVAR:

- twigs are to birds nests as
- nucleotides are to DNA and RNA as
- amino acids are to proteins as
- sugar is to starch as
- oh crap lipids

I'm not going to talk about lipids because they're crazy complex.

So back to nucleotides.

DNA contains four types of them: adenine (`A`), cytosine (`C`), guanine
(`G`), and thymine (`T`).

RNA contains a slightly different set of nucleotides, but we don't care
about that for now.

## Getting Started

Make sure you have read [D page](http://exercism.io/languages/d) on
exercism.io.  This covers the basic information on setting up the development
environment expected by the exercises.

## Passing the Tests

Get the first test compiling, linking and passing by following the [three
rules of test-driven development](http://butunclebob.com/ArticleS.UncleBob.TheThreeRulesOfTdd).
Create just enough structure by declaring namespaces, functions, classes,
etc., to satisfy any compiler errors and get the test to fail.  Then write
just enough code to get the test to pass.  Once you've done that,
uncomment the next test by moving the following line past the next test.

```D
static if (all_tests_enabled)
```

This may result in compile errors as new constructs may be invoked that
you haven't yet declared or defined.  Again, fix the compile errors minimally
to get a failing test, then change the code minimally to pass the test,
refactor your implementation for readability and expressiveness and then
go on to the next test.

Try to use standard D facilities in preference to writing your own
low-level algorithms or facilities by hand.  [DRefLanguage](https://dlang.org/spec/spec.html)
and [DReference](https://dlang.org/phobos/index.html) are references to the D language and D standard library.


## Source

The Calculating DNA Nucleotides_problem at Rosalind [http://rosalind.info/problems/dna/](http://rosalind.info/problems/dna/)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
