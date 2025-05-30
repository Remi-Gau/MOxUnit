# Modox

MOdox is documentation test ("doctest") framework for Matlab and GNU Octave.

!!! note -- "Features"

    -   Runs on both the [Matlab] and [GNU Octave] platforms.
    -   Can be used directly with continuous integration services, such as [coveralls.io].
    -   Extends [MOxUnit](../moxunit/index.md), a unit test framework for Matlab and GNU Octave.

!!! note -- "Compatibility notes"

    -   Because GNU Octave 3.8 and 4.0 do not support `classdef` syntax, 'old-style' object-oriented syntax is used for the class definitions.

!!! warning -- "Limitations"

    -   Expressions with the "for" keyword are not supported in Octave because `evalc` does not seem to support it
    -   It is possible to indicate that an expression throws an exception, but not *which* exception.

## Use with travis-ci

MOdox can be used with the [Travis-ci] services for continuous integration testing.
This is achieved by setting up a `travis.yml` file.
For an example in the related MOxUnit project, see the [MOxUnit travis.yml] file.
