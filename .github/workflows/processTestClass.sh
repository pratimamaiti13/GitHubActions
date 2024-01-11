#!/bin/bash

# Define a function with if-else conditions
my_function() {
    local PR_DESCRIPTION=$1
    if [ -z "$PR_DESCRIPTION" ] || [ "$PR_DESCRIPTION" = "null" ]; then
        TestLevel="NoTestRun"
        TestClasses=""
    elif [ "${PR_DESCRIPTION,,}" = "runlocaltests" ]; then
        TestLevel="RunLocalTests"
        TestClasses=""
    elif [ "${PR_DESCRIPTION,,}" = "runalltestsinorg" ]; then
        TestLevel="RunAllTestsInOrg"
        TestClasses=""
    elif ! [[ "${PR_DESCRIPTION,,}" = "runlocaltests" || "${PR_DESCRIPTION,,}" = "runalltestsinorg" ]]; then
        TestLevelValue="${PR_DESCRIPTION%% *}"
        if [ "${TestLevelValue,,}" = "runspecifiedtests" ]; then
            TestLevel="RunSpecifiedTests"
            TestClasses="${PR_DESCRIPTION#* }"
            TestClasses=$(echo "${TestClasses//,/ }" | tr -s '[:space:]' ' ' | awk '{$1=$1};1')
        else
            TestLevel="NotFound"
            TestClasses="NotFound"
        fi
    fi
    echo "$TestLevel"
    echo "$TestClasses"
}

# Call the function with arguments
my_function "$1"