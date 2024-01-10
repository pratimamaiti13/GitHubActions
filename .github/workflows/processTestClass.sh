#!/bin/bash

# Define a function with if-else conditions
my_function() {
    local PR_DESCRIPTION=$1
    echo "PR Description: $PR_DESCRIPTION"
    PROCESSED_DESCRIPTION=$(echo "${PR_DESCRIPTION}" | tr -d '\r\n' | sed '/^$/d' | awk '{$1=$1};1')
    echo "Original PR Description: ${PR_DESCRIPTION}"
    echo "Trimmed PR Description: ${PROCESSED_DESCRIPTION}"
    if [ -z "$PROCESSED_DESCRIPTION" ]; then
        TestClasses=""
        TestLevel="NoTestRun"
        echo "$TestClasses"
        echo "$TestLevel"
    elif [ "$PROCESSED_DESCRIPTION" = "runlocaltests" ]; then
        TestClasses=""
        TestLevel="RunLocalTests"
        echo "$TestClasses"
        echo "$TestLevel"
    elif [ "$PROCESSED_DESCRIPTION" = "runalltestsinorg" ]; then
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
