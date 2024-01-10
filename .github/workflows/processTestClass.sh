#!/bin/bash

# Define a function with if-else conditions
my_function() {
    local PR_DESCRIPTION=$1
    if [ -z "$PR_DESCRIPTION" ] || [ "$PR_DESCRIPTION" = "null" ]; then
        TestLevel="NoTestRun"
        TestClasses=""
        echo "$TestLevel"
        echo "$TestClasses"
    elif [ "${PR_DESCRIPTION,,}" = "runlocaltests" ]; then
        TestLevel="RunLocalTests"
        TestClasses=""
        echo "$TestLevel"
        echo "$TestClasses"
    elif [ "${PR_DESCRIPTION,,}" = "runalltestsinorg" ]; then
        TestLevel="RunAllTestsInOrg"
        TestClasses=""
        echo "$TestLevel"
        echo "$TestClasses"
    elif ! [[ "${PR_DESCRIPTION,,}" = "runlocaltests" || "${PR_DESCRIPTION,,}" = "runalltestsinorg" ]]; then
        TestLevelValue="${PR_DESCRIPTION%% *}"
        if [ "${TestLevelValue,,}" = "runspecifiedtests" ]; then
            TestLevel="RunSpecifiedTests"
            TestClasses="${PR_DESCRIPTION#* }"
            TestClasses=$(echo "${TestClasses//,/ }" | tr -s '[:space:]' ' ' | awk '{$1=$1};1')
            echo "$TestLevel"
            echo "$TestClasses"
        else
            TestLevel="NotFound"
            TestClasses="NotFound"
            echo "$TestLevel"
            echo "$TestClasses"
        fi
    fi
}

# Call the function with arguments
my_function "$1"
