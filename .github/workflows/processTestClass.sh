#!/bin/bash

# Define a parameterized function
my_function() {
    # $1 is the first parameter, $2 is the second parameter, and so on
    local parameter1=$1
    local parameter2=$2

    # Perform some operations based on the parameters
    result=$((parameter1 + parameter2))

    # Return the result
    echo $result
}

# Call the function with arguments and store the result
output=$(my_function 5 10)

# Print the result
echo "The result is: $output"