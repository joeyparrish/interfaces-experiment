The interface is compiled as part of the library, but the interface is now
exported.  But exporting does not prohibit renaming, it merely creates an
alias from the original name to the renamed version.  Internal to the library,
the renamed interface is still used.

Once again, an uncompiled implementation would break the library.
