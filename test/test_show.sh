#!/bin/bash

# Test script for the 'show' function

# Get the directory of the script
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

# Navigate two levels up
ROOT_PATH=$(cd "$SCRIPT_DIR/../.." && pwd)

command="workswap show"
# Run the 'show' function
echo "Testing command '$command' ..."
"$ROOT_PATH/workswap/bin/workswap" show

if [ $? -eq 0 ]; then
	echo "Status: Success"
else
	echo "Status: Fail"
	exit 1
fi
