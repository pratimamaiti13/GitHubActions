#!/bin/bash

# Define a function with global variables
my_function() {
    # $1 is the first parameter, $2 is the second parameter
    local parameter1=$1
    local parameter2=$2

    # Perform some operations based on the parameters
    result1=$((parameter1 + parameter2))
    result2=$((parameter1 * parameter2))

    # Assign the results to global variables
    global_result1=$result1
    global_result2=$result2
}

# Call the function with arguments
my_function "$1" "$2"

# Access the global variables to get the results
echo "Result 1: $global_result1"
echo "Result 2: $global_result2"
