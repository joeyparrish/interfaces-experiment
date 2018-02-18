Here we remove the namespace declaration in the externs in all forms.  This
produces a compiler warning every time the namespace is mentioned there:

> WARNING - name mynamespace is not defined in the externs.

This is noisy, but it actually works.  We can have all externs in the same
namespace as the library code, and all of our checks on the compiled code pass.

I haven't figured out a working @suppress annotation for the warnings.  Since
we have a working solution in `07-extern-iface-namespace`, I'm going to abandon
this approach.
