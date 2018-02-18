To work around 'declared more than once' errors, here we try using goog.provide
on the extern.  The result is that the compiler acts as if it is ignoring the
@extern annotation completely.  I have no explanation for this.
