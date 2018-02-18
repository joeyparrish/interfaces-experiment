The interface is compiled as part of the library, but the interface uses the
deprecated @expose annotation to prevent renaming.  This generates a warning,
but produces a usable plugin interface.  An uncompiled implementation would not
break the library.

But @expose has the side-effect of preventing renaming on all things with that
name, in any context, including unrelated classes.  This is undesirable.
