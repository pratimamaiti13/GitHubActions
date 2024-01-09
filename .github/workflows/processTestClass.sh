#!/bin/bash

# Define a parameterized function
my_function() {
    # $1 is the first parameter, $2 is the second parameter, and so on
    prDescription="$1"
    if [ -z "$description" ]; then
        Testclasses=""
        TestLevelValue="NoTestRun"
        echo "Test classes are blank and Test level is $TestLevelValue"
        echo "Testclasses=$Testclasses, TestLevelValue=$TestLevelValue"
    fi
}

prDescription="RunSpecifiedTests Class1,Class2,Class3"
processtestclass "$prDescription""
