#!/bin/bash

# Upgrade installed packages
sudo apt-get update
sudo apt list --upgradable
sudo apt-get -y upgrade

# List of packages to install
declare -a PKGS=(
    # TODO: put apt packages here
)

# Install packages
for p in "${PKGS[@]}"
do
    echo Installing "$p"
    sudo apt-get install -y $p
done

# TODO: automate MySQL installation
