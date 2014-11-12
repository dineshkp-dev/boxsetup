#!/bin/bash

# This script will download and setup programs
# Dropbox
# Chrome
# Eclipse
# 

program=""
dropbox_ubuntu=""
download_links_file="download_links"
# Defining the different installers for different distribution
ubuntu_autoinstaller="sudo apt-get install "
fedora_autoinstaller="sudo yum install "
debian_autoinstaller="sudo apt-get install "
# Defining the different types of downloadable file formats
# tar
# tar.gz
# tar.bz2
# gzip
# zip
# rpm
# deb

int=0
declare -a programs
declare -a val

# Check if the input text file was provided as option param;
# Else use the default file in the current location
if [[ -z $1 ]]; 
then
	inputfile="program.txt"
else
	inputfile=$1
fi

# Read the input file
# Obtain the program names as 'programs' Array, size of array is 'int'
function readProgramfile {
	echo "--------------------------------------"
	echo "	Reading the programs for installation from '$1'"
	while read -r line
	do
		program=$line 
		programs[ int ]=$line
		int=$((int+1))
	done < "$1" 

	echo "The following $int programs will be installed for $linuxDistro"
	echo ${programs[*])}
}

# Function to print all of the required programs
function printAllPrograms {
	for program in "${programs[@]}";
	do
		echo "Program name: $program"
	done
}

shopt -s nocasematch 

# Get links
#val[0]=$(awk -F':=' '{print $2}' "$download_links_file");

function readDownloadLinksFile {
	echo "--------------------------------------"
	echo "	Reading the Download Links File"
}

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




# No Function calls should be defined below this, to provide clarity.
echo "STARTING THE SCRIPT..."
# Get the Distribution type from the User
echo "Enter the Linux Distribution type[ UBUNTU|RHEL|DEBIAN ] :"
#read linuxDistro
linuxDistro="ubunTU"
echo "User entered: '$linuxDistro'"


readProgramfile $inputfile
printAllPrograms



if [[ $linuxDistro == "ubuntu" ]];
	then
	ubuntu_download
fi
