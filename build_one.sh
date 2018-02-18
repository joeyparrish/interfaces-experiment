#!/bin/bash

set -e

COMPILER="./node_modules/.bin/google-closure-compiler"
DIR="${1%/}"  # trim trailing slashes

if [ -z "$DIR" ]; then
  echo "Specify a folder to build." 1>&2
  exit 1
fi

# Build the code.
"$COMPILER" --generate_exports -O ADVANCED goog/base.js "$DIR"/*.js > "$DIR".compiled.js

# Extract the console log from main.
LOG_CALL=$(grep console.log "$DIR".compiled.js | sed -e 's/.*\(console.log(.*(12))\).*/\1/')

# Check if the method access was renamed.  It should not be.
echo "$LOG_CALL" | grep -q 'foo(' && echo "SUCCESS" || echo "FAIL"

# Print the extracted text.
echo "$LOG_CALL"
