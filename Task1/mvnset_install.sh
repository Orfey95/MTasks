#!/usr/bin/env bash

set -e

# Exit codes
SUCCESS=0
NOT_SUDO=3
mvnset_version=$1

# Check sudo or root
if [ "$EUID" -ne 0 ]; then 
	echo "This command requires SUDO";
	exit $NOT_SUDO;
fi

# For mvnset v1
if [ "$mvnset_version" -eq 1 ]; then 
	mvnset_version="";
fi 

# Download mvnset to /usr/bin/
wget -qN https://raw.githubusercontent.com/Orfey95/MTasks/master/Task1/mvnset"$mvnset_version" -P /usr/bin/

# Do mvnset executable
chmod +x /usr/bin/mvnset"$mvnset_version"

# Report
if test -f /usr/bin/mvnset"$mvnset_version"; then
	echo "Installation was successful"
else
	echo "Something went wrong"
fi
