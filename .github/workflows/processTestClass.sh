#!/bin/bash

# Define a function with if-else conditions
my_function() {
    local description=$1

    if [ -z "$description" ]; then
        TestClasses=""
        TestLevel="NoTestRun"
        echo "$TestClasses"
        echo "$TestLevel"
    elif [ "$description" = "runlocaltests" ]; then
        TestClasses=""
        TestLevel="RunLocalTests"
        echo "$TestClasses"
        echo "$TestLevel"
    elif [ "$description" = "runalltestsinorg" ]; then
        TestClasses=""
        TestLevel="RunAllTestsInOrg"
        echo "$TestClasses"
        echo "$TestLevel"
    else
        echo "default_value1"
        echo "default_value2"
    fi
}

# Call the function with arguments
my_function "$1"
