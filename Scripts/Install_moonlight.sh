#!/bin/bash

echo -e "\nAdding Moonlight to Sources List..."
		
if grep -q "deb http://archive.itimmer.nl/raspbian/moonlight jessie main" /etc/apt/sources.list; then
    echo -e "NOTE: Moonlight Source Exists - Skipping"
else
    echo -e "Adding Moonlight to Sources List"
    echo "deb http://archive.itimmer.nl/raspbian/moonlight jessie main" >> /etc/apt/sources.list
fi

echo -e "\nFetching and installing the GPG key....\n"

if [ -f /home/pi/itimmer.gpg ]
then	
    echo -e "NOTE: GPG Key Exists - Skipping"
else		
    wget http://archive.itimmer.nl/itimmer.gpg
    chown pi:pi /home/pi/itimmer.gpg
    apt-key add itimmer.gpg		
fi

echo -e "\nUpdating System..."
apt-get update -y

echo -e "\nInstalling Moonlight..."
apt-get install moonlight-embedded -y
echo -e "\nMoonlight Installed!"