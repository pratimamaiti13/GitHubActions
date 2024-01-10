#!/bin/bash

# Define a function with if-else conditions
my_function() {
    local condition=$1

    if [ "$condition" = "string_condition1" ]; then
        echo "value1a"
        echo "value2a"
    elif [ "$condition" = "string_condition2" ]; then
        echo "value1b"
        echo "value2b"
    else
        echo "default_value1"
        echo "default_value2"
    fi
}

# Call the function with arguments
my_function "$1"
