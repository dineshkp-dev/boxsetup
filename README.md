boxsetup
========

Create a shell program that would be able to automatically download programs and setup a Linux Box

The script should be able to do the following steps:
- Identify which files need to be installed -from User
- Identify which linux box is being used (ubuntu/fedora/debian) - from Box
- Download the setup files
	- place setup files in a temp location
	- extract files
	- create a bin link for execution
	- create a '.desktop' file or copy one if already available
