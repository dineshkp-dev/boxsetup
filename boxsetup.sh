#!/bin/bash

# This script will download and setup programs
# Dropbox
# Chrome
# Eclipse
# 

program=""
dropbox_ubuntu=""
download_links_file="download_links"
ubuntu_autoinstaller="sudo apt-get install "
fedora_autoinstaller="sudo yum install "
debian_autoinstaller="sudo apt-get install "

int=0
declare -a programs

echo "Starting the box setup script."
echo "Enter the Linux Box type:"
#read linuxDistro
linuxDistro="ubunTU"

#check if the input text file was provided as option param
if [[ -z $1 ]]; 
then
	inputfile="program.txt"
else
	inputfile=$1
fi

#read the input file
#obtain the program names as 'programs' Array, size of array is 'int'
while read -r line
do
	program=$line 
	programs[ int ]=$line
	int=$((int+1))
done < "$inputfile"

echo "The following $int programs will be installed for $linuxDistro"
echo ${programs[*])}
#run a for loop through each of the programs
for program in "${programs[@]}";
do
	echo "Program name: $program"
done

shopt -s nocasematch 

#get links
val=$(awk -F':=' '{print $2}' "$download_links_file");

echo "************"
echo "value of val: ${val}"
function ubuntu_download {
	echo "Installing programs for Ubuntu"
	echo "wget $programs"
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
