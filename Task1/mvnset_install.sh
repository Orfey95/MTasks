#!/usr/bin/env bash

set -e

# Exit codes
SUCCESS=0
NOT_SUDO=3

# Check sudo or root
if [ "$EUID" -ne 0 ]; then 
	echo "This command requires SUDO";
	exit $NOT_SUDO;
fi

# Download mvnset to /usr/bin/
wget -q https://raw.githubusercontent.com/Orfey95/MTasks/master/Task1/mvnset -P /usr/bin/

# Do mvnset executable
chmod +x /usr/bin/mvnset

# Report
if test -f /usr/bin/mvnset; then
	echo "Installation was successful"
else
	echo "Something went wrong"
fi
