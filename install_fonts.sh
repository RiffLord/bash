#!/bin/bash

# A basic and clunky script for installing fonts on a user's Linux system.
# The user specifies the source directory ($1) and the destination directory ($2).
# The script operates under the assumption that the source directory contains
# multiple subdirectories which store the actual font files; it iterates through
# the specified directory, recreating any subdirectories found in the destination.
# It then proceeds to copy the contents of all subdirectories from the source to
# the destination.
# WARNING: USE WITH CAUTION. THIS SCRIPT OBTAINS sudo PRIVILEGES.

# Check that the source argument isn't empty
if [ -z $1 ];
then
    echo Error: source directory not specified
    exit 1
fi

echo $1
# TODO: add confirmation that the directory is correct, with option to change
# Check that the destination argument isn't empty
if [ -z $2 ];
then
    echo Error: destination directory not specified.
    exit 1
fi

echo $2
# TODO: add confirmation that the directory is correct, with option to change
# Iterate through source directory, copying files to destination
for d in $1*
do
    # If the current item is a directory,
    # recreate it in the destination and
    # copy its contents there.
    if [ -d "$d" ];
    then
	echo Creating $(basename "$d")
	sudo mkdir $2$(basename "$d")
	echo Installing $(basename "$d")
	sudo cp "$d"/* $2$(basename "$d")
    fi
done
exit 0
