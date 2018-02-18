#!/bin/bash

set -e

COMPILER="./node_modules/.bin/google-closure-compiler"
DIR="${1%/}"  # trim trailing slashes

if [ "$DIR" = "" ]; then
  echo "Specify a folder to build." 1>&2
  exit 1
fi

# Build the code.
"$COMPILER" --generate_exports -O ADVANCED goog/base.js "$DIR"/*.js > "$DIR".compiled.js

# Extract the parts of the compiled binary that we want to scrutinize.
LOG_CALL=$(grep console.log "$DIR".compiled.js | sed -e 's/.*\(console\.log(.*(12))\).*/\1/')
INFO_CALL=$(grep console.info "$DIR".compiled.js | sed -e 's/.*\(console\.info(.*(13))\).*/\1/')
PROTOTYPE_FOO=$(grep prototype.foo "$DIR".compiled.js | sed -e 's/.*[^a-z]\([a-z]*\.prototype\.foo\).*/\1/')

# Check if the method access was renamed.  It should NOT be.
if echo "$LOG_CALL" | grep -q 'foo('; then
  echo "SUCCESS: interface access not renamed: $LOG_CALL"
else
  echo "FAIL: interface access renamed: $LOG_CALL"
fi

# Check if the unrelated method with the same name was renamed.  It SHOULD be.
if echo "$INFO_CALL" | grep -q 'foo('; then
  echo "FAIL: unrelated method not renamed: $INFO_CALL"
else
  echo "SUCCESS: unrelated method renamed: $INFO_CALL"
fi

# Check if the impl prototype was renamed.  It should NOT be.
if echo "$PROTOTYPE_FOO" | grep -q 'foo'; then
  echo "SUCCESS: impl exported or not renamed: $PROTOTYPE_FOO"
else
  echo "FAIL: impl renamed or missing: $PROTOTYPE_FOO"
fi
