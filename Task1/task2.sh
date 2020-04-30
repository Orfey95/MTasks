#!/bin/bash


set -e

username=$1
commands=$2

# Convert command string to command array
commands_array=($(echo $commands | tr " " "\n"))

# Get aaray os full path of commands
full_path_commands_array=()
for i in "${commands_array[@]}"
do
	if [ -n "$(which $i)" ]; then
		full_path_commands_array+=( $(which $i) )
	fi
done

# Convert command string to command array
full_path_commands_string=$(IFS=','; echo "${full_path_commands_array[*]}")

# Deny ALL sudo command
if [[ $commands == "ANY" ]]; then
	echo "$username  ALL=(ALL) ALL" > /etc/sudoers.d/$username
else
	echo "$username  ALL=(ALL) $full_path_commands_string" > /etc/sudoers.d/$username
fi

