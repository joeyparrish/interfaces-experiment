Building on `05-extern-iface`, we now try to move the interface and
implementations into a namespace.  We would like this to be the same namespace.
We get the compiler error:

> ERROR - Variable mynamespace declared more than once

This is why Shaka Player currently (v2.3.x) has all library code in the `shaka`
namespace and all externs defined in the `shakaExtern` namespace.

However, adding @suppress {duplicate} seems to fix it!  I'm not sure why we
never tried this.  This could be an improvement over having two namespaces.
