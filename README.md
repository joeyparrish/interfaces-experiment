# External plugin interfaces in the Closure Compiler

This is a series of experiments with the Closure Compiler to determine ways of
creating external plugin interfaces.

An external plugin interface is an interface which is defined by a Closure-based
project, but provided from outside that project.  For example, [Shaka Player][]
has many external plugin interfaces through which applications can customize or
extend the library.

Goals:
  - Document the things that do and don't work, which led us to the current
    plugin system in Shaka Player
  - Discover things that we may not have tried yet which could improve on the
    current plugin system in Shaka Player

[Shaka Player]: https://github.com/google/shaka-player
