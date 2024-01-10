#!/bin/bash

# Define a function with if-else conditions
my_function() {
    local PR_DESCRIPTION=$1
    if [ -z "$PR_DESCRIPTION" ] || [ "$PR_DESCRIPTION" = "null" ]; then
        TestClasses=""
        TestLevel="NoTestRun"
        echo "$TestClasses"
        echo "$TestLevel"
    elif [ "${PR_DESCRIPTION,,}" = "runlocaltests" ]; then
        TestClasses=""
        TestLevel="RunLocalTests"
        echo "$TestClasses"
        echo "$TestLevel"
    elif [ "${PR_DESCRIPTION,,}" = "runalltestsinorg" ]; then
        TestClasses=""
        TestLevel="RunAllTestsInOrg"
        echo "$TestClasses"
        echo "$TestLevel"
    elif ! [[ "${PR_DESCRIPTION,,}" = "runlocaltests" || "${PR_DESCRIPTION,,}" = "runalltestsinorg" ]]; then
        TestLevelValue="${PR_DESCRIPTION%% *}"
        TestClassesValue="${PR_DESCRIPTION#* }"
        echo "$TestClassesValue"
        if [ "${TestLevelValue,,}" = "runspecifiedtests" ]; then
            TestClasses=""
            TestLevel="RunSpecifiedTests"
            echo "$TestClasses"
            echo "$TestLevel"
        else
            TestClasses="NotFound"
            TestLevel="NotFound"
            echo "$TestClasses"
            echo "$TestLevel"
        fi
    fi
}

# Call the function with arguments
my_function "$1"
