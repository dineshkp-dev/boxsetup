BOXSETUP
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

The script is able to do the following steps for UBUNTU OS for 'manual' setup:
- Identify which files need to be installed - from User through the 'programs.txt' file.
- Download the setup files
- Place setup files in a temp location (<code>/tmp/boxsetup/</code>).
- Extract files to the programs directory (<code>/opt</code>).
- Create a bin link for CLI-execution.
- Create a '.desktop' file for the User.
The script is able to do the following steps for UBUNTU OS for 'manual' setup:
- Use the appropriate packaging tool to download and install the file. (<code>apt-get</code>)

Executing the Script:
========
- Download the files from this repository, and extract them into a directory.
- On a terminal go to the directory containing the script.
- Edit the 'programs.txt' file and add-in the programs (one program name as below, per line) that needs to be installed. Currently, the following programs can be installed:
	- <code>sublime</code>
	- <code>eclipse</code>
	- <code>java</code>
	- <code>javajdk</code>
	
- type in the following code :

	<code>sudo ./boxsetup.sh</code>
- All the programs will be installed without any other human intervention. 

Notes:
========
- New programs will be installed to '/opt/new_program/' directory.
- The script uses the '/tmp/' directory as the temporary directory to download and extract the files from their respective sites.
- If you see any issues, kindly raise an 'issue' ticket and we will work to fix it as soon as possible.
	
