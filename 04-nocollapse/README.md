The interface is compiled as part of the library, but the interface uses the
@nocollapse annotation to prevent renaming.  Unfortunately, this doesn't work.
Although the @nocollapse annotation is the replacement for the deprecated
@expose annotation, it does not apply to prototypes.

The interface is therefore renamed, and uncompiled implementations would break
the library.
