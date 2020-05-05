#!/usr/bin/env bash

set -e

# Variables
VAR_ERROR=1
REJECT_INSTALLATION=2
NOT_SUDO=3
ANSWER_ERROR=4

# Check parameters
if [ $# -lt 1 ]; then
	echo "You forgot to enter maven version"
	exit $VAR_ERROR
fi

while [ -n "$1" ]
do
case "$1" in
-y) choice=Y;;
-v) mvn_version=$2
shift;;
esac
shift
done

echo $choice
echo $mvn_version

# Check sudo or root
if [ "$EUID" -ne 0 ]
  then echo "This command requires SUDO";
  exit $NOT_SUDO;
fi

# Сhecking if the required version is installed
if [ ! -d /opt/apache-maven-"$mvn_version" ]; then	
	if [ "$choice" != "Y" ]; then
		read -p "The version of Maven you requested is not installed. Install? Continue (Y/n)? " -e choice
		case "$choice" in 
		  y|Y|"" ) wget -qO- https://archive.apache.org/dist/maven/maven-3/"$mvn_version"/binaries/apache-maven-"$mvn_version"-bin.tar.gz -P /opt | tar -xvz -C /opt > /dev/null 2>&1;;
		  n|N ) exit $REJECT_INSTALLATION;;
		  * ) echo "Incorrect answer"; exit $ANSWER_ERROR;;
		esac
	else
		wget -qO- https://archive.apache.org/dist/maven/maven-3/"$mvn_version"/binaries/apache-maven-"$mvn_version"-bin.tar.gz -P /opt | tar -xvz -C /opt > /dev/null 2>&1
	fi
fi

# Add required version to PATH
if ! cat $HOME/.profile | grep apache-maven > /dev/null 2>&1; then
	echo "export PATH=/opt/apache-maven-$mvn_version/bin:$PATH" | tee -a $HOME/.profile > /dev/null 2>&1
else
	sed -i "s=apache-maven-[0-9.]*=apache-maven-$mvn_version=" $HOME/.profile > /dev/null 2>&1
fi

