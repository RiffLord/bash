#!/bin/bash
# Install apt packages
# Upgrade installed packages
sudo apt-get update
sudo apt list --upgradable
sudo apt-get -y upgrade

# List of packages to install
declare -a PKGS=(
    gcc
    g++
    gdb
    python3.8
    audacity
    dictionaries-common
    easytag
    firefox
    frog
    gimp
    git
    gramps
    neofetch
    yt-dlp
    zorin-icon-themes
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
    com.github.johnfactotum.QuickLookup
    de.haeckerfelix.Fragments
    de.haeckerfelix.Shortwave
    md.obsidian.Obsidian
    org.gabmus.gfeeds
    org.gnome.Dictionary
    org.gnome.Music
    org.gnome.Recipes
    org.onlyoffice.desktopeditors
)

for f in "${FLTPKS[@]}"
do
    echo Installing "$f"
    flatpak install -y $f
done
