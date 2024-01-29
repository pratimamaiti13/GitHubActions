#!/bin/bash
perform_validation() {
    set -x
    args=("$@")
    local TestLevel=${args[0]}
    local TestClasses=${args[1]}
    echo ${args[1]}
    if [ ${TestLevel} = "NoTestRun" ]; then
        sf project deploy start --manifest Delta/package/package.xml --target-org ${SF_USERNAME} --wait 20 --dry-run --json
    elif [ ${TestLevel} = "RunLocalTests" ] || [ ${TestLevel} = "RunAllTestsInOrg" ]; then
        sf project deploy start --manifest Delta/package/package.xml --target-org pratimamaiti@nagarro.com --test-level $TestLevel --wait 20 --dry-run --json
    elif [ ${TestLevel} = "RunSpecifiedTests" ]; then
        sf project deploy start --manifest Delta/package/package.xml --target-org pratimamaiti@nagarro.com --test-level $TestLevel --tests $TestClasses --wait 20 --dry-run --json
    else
        echo "Test level and test class value are not correct."
    fi
}
perform_validation "$@"
