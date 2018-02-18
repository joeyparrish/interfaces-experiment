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

# Extract the console.log call from main.
LOG_CALL=$(grep console.log "$DIR".compiled.js | sed -e 's/.*\(console.log(.*(12))\).*/\1/')

# Check if the method access was renamed.  It should NOT be.
if echo "$LOG_CALL" | grep -q 'foo('; then
  OK=1
  echo "SUCCESS: interface not renamed"
else
  OK=0
  echo "FAIL: interface renamed"
fi

# Print the extracted text.
echo "$LOG_CALL"

# Check for a call to console.info.
INFO_CALL=$(grep console.info "$DIR".compiled.js | sed -e 's/.*\(console.info(.*(13))\).*/\1/')

# If console.info call was found and the previous check passed, check for renaming here, too.
if [ "$OK" = "1" && "$INFO_CALL" != "" ]; then
  # Check if the method access was renamed.  It SHOULD be.
  echo "$INFO_CALL" | grep -q 'foo(' && echo "FAIL: unrelated renamed" || echo "SUCCESS: unrelated still renamed"

  # Print the extracted text.
  echo "$INFO_CALL"
fi
