#!/bin/bash
perform_validation() {
    set -x
    args=("$@")
    local TestLevel=${args[0]}
    local TestClasses=${args[1]}
    echo "Number of lines in destructive is ${TotalLineInDestructiveChanges}"
    echo ${args[1]}
    if [ ${TotalLineInDestructiveChanges} > 4 ]; then
        if [ ${TestLevel} = "NoTestRun" ]; then
            sf project deploy start --manifest Delta/package/package.xml --pre-destructive-changes destructiveChanges/destructiveChanges.xml --target-org $SF_USERNAME --wait 20 --dry-run --json
        elif [ ${TestLevel} = "RunLocalTests" ] || [ ${TestLevel} = "RunAllTestsInOrg" ]; then
            sf project deploy start --manifest Delta/package/package.xml --pre-destructive-changes destructiveChanges/destructiveChanges.xml --target-org pratimamaiti@nagarro.com --test-level $TestLevel --wait 20 --dry-run --json
        elif [ ${TestLevel} = "RunSpecifiedTests" ]; then
            sf project deploy start --manifest Delta/package/package.xml --pre-destructive-changes destructiveChanges/destructiveChanges.xml --target-org pratimamaiti@nagarro.com --test-level $TestLevel --tests $TestClasses --wait 20 --dry-run --json
        else
            echo "Test level and test class value are not correct."
        fi
    else 
        if [ ${TestLevel} = "NoTestRun" ]; then
            sf project deploy start --manifest Delta/package/package.xml --target-org $SF_USERNAME --wait 20 --dry-run --json
        elif [ ${TestLevel} = "RunLocalTests" ] || [ ${TestLevel} = "RunAllTestsInOrg" ]; then
            sf project deploy start --manifest Delta/package/package.xml --target-org pratimamaiti@nagarro.com --test-level $TestLevel --wait 20 --dry-run --json
        elif [ ${TestLevel} = "RunSpecifiedTests" ]; then
            sf project deploy start --manifest Delta/package/package.xml --target-org pratimamaiti@nagarro.com --test-level $TestLevel --tests $TestClasses --wait 20 --dry-run --json
        else
            echo "Test level and test class value are not correct."
        fi
    fi
}
perform_validation "$@"
