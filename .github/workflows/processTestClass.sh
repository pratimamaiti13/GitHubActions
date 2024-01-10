#!/bin/bash

# Define a function with if-else conditions
my_function() {
    local description=$1

    if [ -z "$description" ]; then
        TestClasses=""
        TestLevel="NoTestRun"
        echo "TestClasses"
        echo "TestLevel"
    elif [ "$description" = "string_condition2" ]; then
        echo "value1b"
        echo "value2b"
    else
        echo "default_value1"
        echo "default_value2"
    fi
}

# Call the function with arguments
my_function "$1"
