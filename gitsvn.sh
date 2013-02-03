#!/bin/sh

# Input arguments
echo "$1";

# Read all config data that is available in ~.git
# git config -l

echo $( git config --get remote.origin.url );

echo ${DIR};