#!/bin/bash

# Define a parameterized function
my_function() {
    # $1 is the first parameter, $2 is the second parameter, and so on
    prDescription="$1"
    if [ -z "$prDescription" ]; then
        export TEST_CLASSES=""  # Updated variable name
        export TEST_LEVEL="NoTestRun"  # Updated variable name
        echo "Test classes are blank, and Test level is $TEST_LEVEL"
    fi
}

# Example usage:
prDescription="$1"
my_function "$prDescription"

# Assign the values to the global variables
echo "Result 1: $TEST_CLASSES"  # Updated variable name
echo "Result 2: $TEST_LEVEL"  # Updated variable name
