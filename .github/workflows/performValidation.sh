#!/bin/bash
perform_validation() {
    set -x
    eval TestLevel="$1"
    eval TestClasses="$2"
    echo "string1 = ${TestLevel}"
    echo "string2 = ${TestClasses}"
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
var1="firstString"
var2="second string with spaces"
perform_validation "\${TestLevel}" "\${TestClasses}"
