#!/usr/bin/env bats

load ../bin/operations.sh

setup() {
    SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
    ROOT_PATH=$(cd "." && pwd)

    # Create temporary files for testing
    touch "$ROOT_PATH/env/test_env_1"
    touch "$ROOT_PATH/env/test_env_2"
    touch "$ROOT_PATH/env/test_env_3"
}

# Cleanup function
teardown() {
    # Clean up temporary files and directories
    rm "$ROOT_PATH/env/test_env_1"
    rm "$ROOT_PATH/env/test_env_2"
    if [ -e "$ROOT_PATH/env/test_env_3" ]; then
        rm "$ROOT_PATH/env/test_env_3"
    fi
}

@test "Show function" {
    # Call the function and capture the output
    run show

    # Test whether the output contains both files
    grep -q "test_env_1" <<< "$output"
    grep -q "test_env_2" <<< "$output"
}

@test "Remove function" {

    # Call the function with the test data
    run remove test_env_3

    # Check whether the file is removed
    [ ! -f "$ROOT_PATH/env/test_env_3" ]
}
