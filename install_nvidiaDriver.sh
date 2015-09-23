#!/bin/bash
#Refer to : https://romancollins.wordpress.com/2015/08/11/how-i-installed-nvidia-proprietary-drivers-on-xubuntu-14-04/
# I am doing the same steps defined in the site above

(
	declare GRUB_LOC="/etc/default/grub"
	declare driver_version=""
	declare -i int=1

	function check_user {
		if [[ $EUID != 0 ]]; then
		   echo "This script must be executed as root"
		   exit -1;
		fi
	}

	function check_for_grub {
		if [[ ! -f  ${GRUB_LOC} ]]; then
			echo "Grub file not found at ${GRUB_LOC}"
			exit -1;
		fi
	}

	function execute_driver_search {
		echo "Executing search for available nvidia drivers."
		sudo apt-cache search nvidia-*

	}
	
	check_user
	check_for_grub
	echo "Changing GRUB CMDLINE in ${GRUB_LOC}"
	sed -i.bak 's/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet splash\"/GRUB_CMDLINE_LINUX_DEFAULT=\”nomodeset\”/' ${GRUB_LOC}
	echo "Creating new Grub Config file..."
	sudo grub-mkconfig -o /boot/grub/grub.cfg
	echo "Adding nvidia ppa"
	sudo add-apt-repository ppa:xorg-edgers/ppa
	echo "Doing repository update before searching for available nvidia drivers..."
	sudo apt-get update
	
	while true; do 
		execute_driver_search
		echo "Enter the nvidia driver version to install (to redo search please enter \"search\"):"
		read driver_version

		shopt -s nocasematch
		if [[ ! ${driver_version} = "search" ]]; then
			{
				echo "Using driver version: ${driver_version}."
				break;
			}
		elif [[ $((int)) = 3 ]]; then
			{
				echo "Maximum retries reached."
				echo "Aborting."
				exit -1;
			}
		fi
		int=$((int+1))
		shopt -u nocasematch 
	done

	echo "Installing driver: nvidia-${driver_version}"
	sudo apt-get install nvidia-355
	if [[ $? ]]; then
		{
		echo "Installed nvidia-${driver_version} successfully."
	}
	else {
		echo "Some exception occurred."
		exit -1;
	}
	fi
	echo "Creating nvidia xconfig."
	sudo nvidia-xconfig
	echo "Completed installation. Please reboot system."
) 2>&1 | tee -a nvidia_installation.log
