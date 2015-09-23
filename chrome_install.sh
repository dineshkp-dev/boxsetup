#!/bin/bash
echo "Adding the public key"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
echo "Adding google download list to apt sources"
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
echo "Updating the files"
sudo apt-get update
echo "Installing chrome..."
sudo apt-get install google-chrome-stable -y
echo "Completed!"
echo "Installing Compiz"
sudo apt-get install compiz compiz-plugins compizconfig-settings-manager metacity -y
echo "Checkout: http://www.webupd8.org/2012/11/how-to-set-up-compiz-in-xubuntu-1210-or.html"
sudo apt-get install dconf-tools -y


