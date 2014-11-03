#!/bin/bash

# This script will download and setup programs
# Dropbox
# Chrome
# Eclipse
# 

program=""
dropbox_ubuntu=""
download_links_file="download_links"
ubuntu_installer="sudo apt-get install "
fedora_installer="sudo yum install "
debian_installer="sudo apt-get install "
int=0
declare -a programs

echo "Starting the box setup script."
echo "Enter the Linux Box type:"
#read linuxDistro
linuxDistro="ubunTU"

inputfile="$1"
echo $linuxDistro

while read -r line
do
	program=$line 
	programs[ int ]=$line
	int=$((int+1))
done < "$inputfile"
echo "The following $int programs will be installed for $linuxDistro"
echo ${programs[*])}

for program in {$programs[@]};
do
	echo "Program name: $program"
done

shopt -s nocasematch 

awk -F':=' '{print $2}' $download_links_file;

function ubuntu_download {
	echo "Installing programs for Ubuntu"
	echo "wget $programs[$int]"
}

function fedora_download {
	echo "Installing programs for Fedora"
}

function debian_download {
	echo "Installing programs for Debian"
}

if [[ $linuxDistro == "ubuntu" ]];
	then
	ubuntu_download
fi
