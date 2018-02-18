The interface has been moved to externs.  It no longer uses goog.provide, and
users/implementers of the interface no longer goog.require it.

The interface is no longer renamed, and unrelated methods of the same name will
still be renamed as they should.  This is ideal, but it turns out that this is
only working this way due to a detail of what we **aren't** doing.  See
`06-extern-iface-export-impl` to see it subtly break again.
