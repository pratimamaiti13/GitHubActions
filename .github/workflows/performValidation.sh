#!/bin/bash
perform_validation() {
    set -x
    local TestLevel=$1
    local TestClasses=$2
    if [ ${TestLevel} = "NoTestRun" ]; then
        sf project deploy start --manifest Delta/package/package.xml --target-org pratimamaiti@nagarro.com --wait 20 --dry-run --json
    elif [ ${TestLevel} = "RunLocalTests" ] || [ ${TestLevel} = "RunAllTestsInOrg" ]; then
        sf project deploy start --manifest Delta/package/package.xml --target-org pratimamaiti@nagarro.com --test-level $TestLevel --wait 20 --dry-run --json
    elif [ ${TestLevel} = "RunSpecifiedTests" ]; then
        sf project deploy start --manifest Delta/package/package.xml --target-org pratimamaiti@nagarro.com --test-level $TestLevel --tests $TestClasses --wait 20 --dry-run --json
    else
        echo "Test level and test class value are not correct."
    fi
}
perform_validation "$1 $2"
