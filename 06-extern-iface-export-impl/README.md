This is the same as `05-extern-iface`, except that we also export `foo()` in the
implementation.  Strangely, this doesn't do anything adverse to the interface or
implementation, but it somehow prevents the unrelated class from being renamed.
This is really strange, and I have no explanation for it.

This is probably the closest model to how Shaka Player is structured today
(v2.3.x), and aside from the lack of deprecation warnings, the results are no
better than `03-expose`.
