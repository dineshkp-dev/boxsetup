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
		#program=$line 
		programs[ int ]=$line
		int=$((int+1))
	done < "$1" 

	echo "The following $int programs will be installed for $linuxDistro"
	for program in ${programs[@]}
	do
		#echo $entry
		echo $program
	done
}

# Function to print all of the required programs
function printAllPrograms {
	for program in ${programs[@]}
	do
		echo "Program name: $program"
	done
}

shopt -s nocasematch 

function readDownloadLinksFile {
	echo "--------------------------------------"
	echo "	Parsing the download links file '$download_links_file'"
	IFS=$'\n'
	int=0
	while read -r line
	do
		#download_links=$line 
		download_links[ $int ]=$line
		int=$((int+1))
		
	done < "$download_links_file" 

	echo "Succesfully obtained information about ${int} installers."
	# Enable the below for debugging
	# for downloadsEntry in ${download_links[@]}
	# do
	# echo $downloadsEntry
	# done
}

function ubuntu_download {
	echo "Installing programs for Ubuntu"
	echo "wget ${programs[@]}"
}

function get_ubuntu_downloads_list {
	
	local counter=0
	local distro=""
	local program_name=""
	echo "Getting the list of programs for Ubuntu..."
	
	#declare -a download_links
	#download_links=$1
	#echo ${download_links[@]}
	for downloadsEntry in ${download_links[@]}
	do
		distro=$(echo $downloadsEntry | awk -F'_' {'print $1'})
		program_name=$(echo $downloadsEntry | awk -F'_' {'print $2'})
		for program in ${programs[@]}
		do
			if [[ "${distro}" == "ubuntu" ]] && [[ "${program_name}" == "${program}" ]]
			then
				ubuntu_download_links[ counter ]=${downloadsEntry}
				echo "Found entry for program: ${program} ,for distro: ${distro};"
				counter=$((counter+1))
			fi
		done
	done

	echo "Found '${counter}' programs for Ubuntu."
	# Enable the below for debugging
	#for ubuntu_entry in ${ubuntu_download_links[@]}
	#do
	#	echo $ubuntu_entry
	#done
	#echo "wget $programs"
}

function ubuntu_install {
	echo "Installing programs for Ubuntu"
	echo "wget ${programs[@]}"
	local installer_type=""
	local program_name=""
	local counter=0
	for ubuntu_entry in ${ubuntu_download_links[@]}
	do
		program_name=$(echo $ubuntu_entry | awk -F'_' {'print $2'})
		installer_type=$(echo $ubuntu_entry | awk -F'_' {'print $3'} | awk -F':=' {'print $1'})
		ubunutu_downloads_program_name[counter]=$program_name
		ubunutu_downloads_installer_type[counter]=$installer_type
		# echo ${ubunutu_downloads_installer_type[counter]}
		# echo ${ubunutu_downloads_program_name[counter]}
		counter=$((counter+1))
	done
}


int=0
declare -a programs
declare -a download_links
declare -a ubuntu_download_links
declare -a ubunutu_downloads_program_name
declare -a ubunutu_downloads_installer_type


# No Function calls should be defined below this, to provide clarity.
echo "STARTING THE SCRIPT..."
# Get the Distribution type from the User
echo "Enter the Linux Distribution type[ UBUNTU|RHEL|DEBIAN ] :"
#read linuxDistro
linuxDistro="ubunTU"
echo "User entered: '$linuxDistro'"


readProgramfile $inputfile
readDownloadLinksFile
#echo ${download_links[@]}
#printAllPrograms




if [[ $linuxDistro == "ubuntu" ]];
	then
		get_ubuntu_downloads_list ${download_links[@]}
		#ensure that only the required programs are selected...
		ubuntu_install
		echo "Again....................................."
fi
shopt -u nocasematch
