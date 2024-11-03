## ⚠️ This repository has been archived ⚠️
#### This repository has been archived because a similar repository will be made. I am currently working on a "Bash Binary Installer".
---
# Unofficial Godot installer for Ubuntu Desktop

### This is an unofficial Godot installer for Ubuntu and probably all other Linux distros that use the GNOME DE  (IDK I NEVER TESTED).

## Why did i create this

I know it may be useless but one day I was bored and said "Wait, Godot doesn't have an official installer because it's a portable executable, just a 100MB binary file, I can waste some time creating one… Or just play with some bash" and decided to write a small bash script to "install" Godot and create a launcher item, so I can pin it and have it on the dock.

## How to use

Just clone the repo and run the Install.sh file.

You can clone the repository by running the following

```bash
git clone https://github.com/CheesymoonBrainstorms/Godot-Installer.git
```

CD into it and run the installer

```bash
cd Godot-Installer/
./install.sh
```

You will be prompted for the URL of a zip archive with the Godot binary file in it. You can use the zip file of one of the releases from Godot's GitHub like this one `https://github.com/godotengine/godot-builds/releases/download/4.3-stable/Godot_v4.3-stable_linux.x86_64.zip`

## Note

If you run the script, and you get a permission denied like this `bash: ./install.sh: Permission denied` then you can run the following command. It should run without any problems after:

```bash
chmod +x install.sh
```
