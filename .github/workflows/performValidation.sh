#!/bin/bash

# Define a function with if-else conditions
perform_validation() {
    set -x
    local TestLevel=$1
    local TestClasses=$2
    if [ ${TestLevel} = "NoTestRun" ]; then
        sf project deploy start --manifest Delta/package/package.xml --target-org pratimamaiti@nagarro.com --wait 20 --dry-run --json
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
perform_validation "$1 $2"
