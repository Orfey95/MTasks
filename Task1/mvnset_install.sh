#!/usr/bin/env bash

set -ex

# Exit codes
SUCCESS=0
NOT_SUDO=3
mvnset_version=$1

# Check sudo or root
if [ "$EUID" -ne 0 ]; then 
	echo "This command requires SUDO";
	exit $NOT_SUDO;
fi

if [ "$mvnset_version" -eq 1 ]; then 
	mvnset_version="";
fi 

# Download mvnset to /usr/bin/
wget -q https://raw.githubusercontent.com/Orfey95/MTasks/master/Task1/mvnset"$mvnset_version" -P /usr/bin/

# Do mvnset executable
chmod +x /usr/bin/mvnset"$mvnset_version"

# Report
if test -f /usr/bin/mvnset"$mvnset_version"; then
	echo "Installation was successful"
else
	echo "Something went wrong"
fi
