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

## TODO

 - `05-extern-iface` works well, but is brittle (see `06-extern-iface-export-impl`).
   If this could be made less brittle, it would be a good improvement for Shaka Player.
 - `07-extern-iface-namespace` is already a good improvement for Shaka Player.
   We could use this technique to put the externs into the same namespace as the library.
 - Experiment with using structural interfaces instead of record types.
   See https://github.com/google/closure-compiler/wiki/Structural-Interfaces-in-Closure-Compiler
