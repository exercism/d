# xDLang

Exercism exercises in the D Programming Language

[![Build Status](https://travis-ci.org/exercism/dlang.svg?branch=master)](https://travis-ci.org/exercism/dlang)

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

## Contributing Guide

Please see the [contributing guide](https://github.com/exercism/x-api/blob/master/CONTRIBUTING.md#the-exercise-data)


### D icon
The D "Digital Mars" logo is owned by Digital Mars, Inc. Digital Mars, Inc. allows anyone to use, modify and redistribute the logo provided that the copyright holder is properly attributed. The original image is part of the D programming language "dlang.org" source repository, released under version 1.0 of the Boost Software License. We have modified the image, changing the colour scheme, to create the D icon for Exercism.
