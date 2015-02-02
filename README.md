boxsetup
========

Create a BASH script that would be able to automatically download programs and setup programs on a freshly installed Linux Machine.

The main motivation behind the script was to quickly allow users to start using their Linux machine, without having to spend too much time downloading and setting up programs that are commonly used.
The programs that are currently supported are:
(Manual Install)
- eclipse
- sublime 2.0
(Auto Install)
- java jre (open jdk 1.7)
- java jdk (open jdk 1.7)

The script should be able to do the following steps:
- Identify which files need to be installed - from User through the 'programs.txt' file.
- Download the setup files
	- place setup files in a temp location
	- extract files
	- create a bin link for execution
	- create a '.desktop' file or copy one if already available

Executing the Script:
====================
- Download the files, and extract them into a directory.
- On a terminal (pointing to the directory) type:
	<code>sudo ./boxsetup.sh</code>

Notes:
======
- New programs will be installed to '/opt/new_program/' directory.
- The script uses the '/tmp/' directory as the temporary directory to download and extract the files from their respective sites.
	
