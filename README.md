# Exercism D Track

[![Tests](https://github.com/exercism/d/workflows/Tests/badge.svg?branch=main)](https://github.com/exercism/d/actions/workflows/tests.yml?query=branch%3Amain)
[![GitHub issues](https://img.shields.io/github/issues/exercism/d.svg)](https://github.com/exercism/d/issues)
[![GitHub forks](https://img.shields.io/github/forks/exercism/d.svg)](https://github.com/exercism/d/network)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/exercism/d/master/LICENSE)

**`D`** is one of many programming languages you can study on [exercism.org](https://exercism.org/).
This repo holds all the instructions, tests, code, & support files for D _exercises_ currently under development or implemented & available for students.
If you haven't already, you can check out and study the live language track [here](https://exercism.org/tracks/d).

🌟 &nbsp;&nbsp;The test runner is currently using the DMD compiler v2.109.0.

## Filenames

Each exercise is identified by a slug.
The slug is all lower-case, and if it is multiple words, it is hyphenated.

E.g. `circular-buffer`.

The following conventions are used when adding a new exercise:

* Name the directory `$SLUG`
* Place the tests in `source/$SLUG.d`, replacing hyphens with underscores.
* Place the example solution in `example/$SLUG.d`, replacing hyphens with underscores.
* Add a file named `dub.sdl` with two lines: `name "$SLUG"` and `buildRequirements "disallowDeprecations"`.

E.g.

```
$ tree exercises/circular-buffer
exercises/circular-buffer/
├── dub.sdl
├── source
│   └── circular_buffer.d
└── example
    └── circular_buffer.d

2 directories, 3 files
```

## Contributing

If you're having trouble getting this project set up locally, please open an issue and we'll help you get it sorted (and then see about improving the documentation).

There is useful Exercism-wide documentation about contributing to language tracks in the [exercism/docs](https://github.com/exercism/docs/blob/master/language-tracks/README.md) repository.

## D icon
The D "Digital Mars" logo is owned by Digital Mars, Inc. Digital Mars, Inc. allows anyone to use, modify and redistribute the logo provided that the copyright holder is properly attributed. The original image is part of the D programming language "dlang.org" source repository, released under version 1.0 of the Boost Software License. We have modified the image, changing the colour scheme, to create the D icon for Exercism.
