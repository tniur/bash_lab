#!/bin/bash

# Declaring variables
is_number="^[0-9]+$"
prefix=$1
start_index=$2
end_index=$3

# Print help instruction function
print_help() {
    echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo -e "INSTRUCTION\n"
    echo "The Script creates a certain number of directories with the specified name."
    echo "The Start and End indexes must be a positive number and the Start index must be less than or equal to the End one."
    echo -e "\n./script <<< [directories name] [start directories index] [end directories index]"
    echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
}

if [ "$1" == "-h" ] || [ "$1" == "--help" ];then # Checking the first parameter for the help flag
    print_help
	exit 0
elif [[ $prefix == -* ]]; then
    echo -e "\nERROR: The first parameter cannot start with a character \"-\".
    You can read the instructions using the flag [-h] or [--help].\n"
    exit -1
elif [ -z $prefix ] || [ -z $start_index ] || [ -z $end_index ];then  # Checking all parameters for existence
    echo -e "\nERROR: Some or all parameters are empty!
	You can read the instructions using the flag [-h] or [--help].\n"
	exit -2
elif [[ ! $start_index =~ $is_number ]] || [[ ! $end_index =~ $is_number ]];then # Checking index parameters for the validity of numbers
    echo -e "\nERROR: The Start and End indexes must be a positive number.
    You can read the instructions using the flag [-h] or [--help].\n"
    exit -3
elif [ "$start_index" -gt "$end_index" ]; then # Checking the first parameter for being less than or equal to the second one
    echo -e "\nERROR: The Start index must be less than or equal to the End one.
    You can read the instructions using the flag [-h] or [--help].\n"
    exit -4
else # Creating a directory with the appropriate names in a loop from the initial index to the last one
    for (( index=$start_index; index<($end_index+1); index++ )); do
        dir_name="${prefix}_${index}"
        mkdir $dir_name
    done
    exit 0
fi