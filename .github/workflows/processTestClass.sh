#!/bin/bash

# Define a parameterized function
my_function() {
    # $1 is the first parameter, $2 is the second parameter, and so on
    prDescription="$1"
    if [ -z "$prDescription" ]; then
        Testclasses=""
        TestLevelValue="NoTestRun"
        echo "Test classes are blank and Test level is $TestLevelValue"
        Testclasses=$Testclasses
        TestLevelValue=$TestLevelValue
    fi
}

# Example usage:
prDescription="RunSpecifiedTests Class1,Class2,Class3"
my_function "$prDescription"
echo "Result 1: $Testclasses"
echo "Result 2: $TestLevelValue"