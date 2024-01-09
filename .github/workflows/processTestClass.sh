#!/bin/bash

# Define a parameterized function
my_function() {
    # $1 is the first parameter, $2 is the second parameter, and so on
    prDescription="$1"
    if [ -z "$prDescription" ]; then
        export Test_classes=""
        export Test_LevelValue="NoTestRun"
        echo "Test classes are blank and Test level is $Test_LevelValue"
    fi
}

# Example usage:
prDescription="$1"
my_function "$prDescription"

# Assign the values to the global variables
echo "Result 1: $Test_classes"
echo "Result 2: $Test_LevelValue"
