#!/usr/bin/env bash

set -xe

# Variables
mvn_version=$1 # Example: 3.6.1

# Сhecking if the required version is installed
if ! ls /opt | grep apache-maven-$mvn_version > /dev/null; then
	wget -qO- https://archive.apache.org/dist/maven/maven-3/$mvn_version/binaries/apache-maven-$mvn_version-bin.tar.gz -P /opt | tar -xvz -C /opt > /dev/null
fi

# Add required version to $PATH
if ! cat $HOME/.profile | grep apache-maven; then
	echo "export PATH=/opt/apache-maven-$mvn_version/bin:$PATH" | tee -a $HOME/.profile
else
	sed -i "s=apache-maven-[0-9.]*=apache-maven-$mvn_version=" $HOME/.profile
fi
