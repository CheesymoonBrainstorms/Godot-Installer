#!/bin/bash



stage() {
    clear
    printf "$1\n\n\n"
    sleep 0.25
}

stage "Updating system"
sudo apt-get update
sudo apt-get upgrade

stage "Installing dependencies"
sudo apt install unzip wget

stage "Getting URL"
printf "Paste the URL of the desired version of Godot Engine release zip archive\nExample: https://github.com/godotengine/godot-builds/releases/download/4.3-stable/Godot_v4.3-stable_linux.x86_64.zip\n\nURL: "
read URL

stage "Checking URL validity"
if curl --head --silent $URL > /dev/null 2>&1; then
    printf "URL exists\n"
else
    printf "URL doesn't exist or isn't reachable\n"
    exit
fi

stage "WARNING"
printf "If there is a folder in the current directory with the name \"Godot-Install\", it will be deleted and replaced! The reason is that this script creates a temporary folder that is used for downloading and extracting some files.\n\nDo you wish to continue? (y/n) "
read choice

if [ "$choice" != "y" ] && [ "$choice" != "Y" ]; then
    clear
    printf "Canceling...\n"
    sleep 0.5
    exit
fi

stage "Downloading Godot"

sudo rm -rvf Godot-Install/
sudo mkdir Godot-Install
cd Godot-Install

sudo wget $URL
zipfile="$(ls)"

stage "Extracting zip file"

sudo unzip $zipfile
sudo rm -rvf $zipfile

binaryfile="$(ls)"
mkdir -p ~/.local/bin/
sudo mv -v $binaryfile ~/.local/bin/godot

cd ..
sudo rm -rvf Godot-Install/

printf "\nExtracted Binary!\n\n"
sleep 0.25


stage "Creating application shortcut"

mkdir -p ~/.local/share/applications/Icons/
cp -v Resources/icon.png ~/.local/share/applications/Icons/Godot.png

printf "Creating ~/.local/share/applications/Godot.desktop\n"
printf "[Desktop Entry]\nVersion=1.0\nName=Godot\nExec=$HOME/.local/bin/godot\nIcon=$HOME/.local/share/applications/Icons/Godot.png\nTerminal=false\nType=Application\nCategories=Utility;" > ~/.local/share/applications/Godot.desktop
printf "Done!"
sleep 0.25

clear
printf "Done! For the icon to show in the dock, click on \"Show Apps\" from your dock, then search for \"Godot\" and right-click on the icon and select \"Pin to Dash\".\nIf you wish to update/upgrade Godot, run the script again and use the URL of the desired version of Godot.\n\n"