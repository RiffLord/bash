#!/bin/bash
# Install apt packages
# Upgrade installed packages
sudo apt-get update
sudo apt list --upgradable
sudo apt-get -y upgrade

# List of packages to install
declare -a PKGS=(
    # TODO: put apt packages here
)

for p in "${PKGS[@]}"
do
    echo Installing "$p"
    sudo apt-get install -y $p
done

# Install flatpaks
# Upgrade installed flatpaks
flatpak update

# List of flatpaks to install
declare -a FLTPKS=(
    # TODO: put apt packages here
)

for f in "${FLTPKS[@]}"
do
    echo Installing "$f"
    flatpak install -y $f
done
