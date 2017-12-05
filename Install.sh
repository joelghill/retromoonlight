#!/bin/bash

echo -e "\n****************************************************************"
echo -e "Welcome to the Moonlight Installer Script for RetroPie v1.0.0.0"
echo -e "****************************************************************\n"
echo -e "Select an option:"
echo -e " * 1: Install Moonlight,Pair,Install Scripts,Install Menus"
echo -e " * 2: Install Moonlight themes"
echo -e " * 3: Remove Launch Scripts"
echo -e " * 4: Re Pair Moonlight with PC"
echo -e " * 5: Update This Script"


read NUM
case $NUM in
	1)
		echo -e "\nPHASE ONE: Add Moonlight to Sources List"
		echo -e "****************************************\n"
		
		if grep -q "deb http://archive.itimmer.nl/raspbian/moonlight jessie main" /etc/apt/sources.list; then
			echo -e "NOTE: Moonlight Source Exists - Skipping"
		else
			echo -e "Adding Moonlight to Sources List"
			echo "deb http://archive.itimmer.nl/raspbian/moonlight jessie main" >> /etc/apt/sources.list
		fi
		
		echo -e "\n**** PHASE ONE Complete!!!! ****"

		echo -e "\nPHASE TWO: Fetch and install the GPG key"
		echo -e "****************************************\n"
		
		if [ -f /home/pi/itimmer.gpg ]
		then	
			echo -e "NOTE: GPG Key Exists - Skipping"
		else		
			wget http://archive.itimmer.nl/itimmer.gpg
			chown pi:pi /home/pi/itimmer.gpg
			apt-key add itimmer.gpg		
		fi

		echo -e "\n**** PHASE TWO Complete!!!! ****"

		echo -e "\nPHASE THREE: Update System"
		echo -e "**************************\n"
		apt-get update -y
		echo -e "\n**** PHASE THREE Complete!!!! ****"
		
		echo -e "\nPHASE FOUR: Install Moonlight"
		echo -e "*****************************\n"
		apt-get install moonlight-embedded -y
		echo -e "\n**** PHASE FOUR Complete!!!! ****"
		
		echo -e "\nPHASE FIVE: Pair Moonlight with PC"
		echo -e "**********************************\n"
		echo -e "Once you have input your STEAM PC's IP Address below, you will be given a PIN"
		echo -e "Input this on the STEAM PC to pair with Moonlight. \n"
		read -p "Input STEAM PC's IP Address here :`echo $'\n> '`" ip
		sudo -u pi moonlight pair $ip
		echo -e "\n**** PHASE FIVE Complete!!!! ****"		
		
		echo -e "\nPHASE SIX: Create Moonlight Menu for RetroPie"
		echo -e "*****************************************\n"
		
		if [ -f /home/pi/.emulationstation/es_systems.cfg ]
		then	
			echo -e "Removing Duplicate Systems File"
			rm /home/pi/.emulationstation/es_systems.cfg
		fi
		
		echo -e "Copying Systems Config File"
		cp /etc/emulationstation/es_systems.cfg /home/pi/.emulationstation/es_systems.cfg
			
		if grep -q "<system>\n    <name>steam</name>\n    <fullname>Steam</fullname>\n    <path>~/RetroPie/roms/moonlight</path>\n    <extension>.sh .SH</extension>\n    <command>bash %ROM%</command>\n    <platform>pc</platform>\n    <theme>moonlight</theme>\n  </system>\n</systemList>" /home/pi/.emulationstation/es_systems.cfg; then
			echo -e "NOTE: Moonlight Entry Exists - Skipping"
		else
			echo -e "Adding Steam to Systems"
			sudo sed -i -e 's|</systemList>|  <system>\n    <name>steam</name>\n    <fullname>Steam</fullname>\n    <path>~/RetroPie/roms/moonlight</path>\n    <extension>.sh .SH</extension>\n    <command>bash %ROM%</command>\n    <platform>pc</platform>\n    <theme>moonlight</theme>\n  </system>\n</systemList>|g' /home/pi/.emulationstation/es_systems.cfg
		fi
		echo -e "\n**** PHASE SIX Complete!!!! ****"

		echo -e "\nPHASE SEVEN: Create Refresh script in Moonlight"
		echo -e "**********************************************************\n"
		
		echo -e "Create Scripts"
		
        bash ./Install_moonlight.sh

		echo -e "\n**** PHASE SEVEN Complete!!!! ****"

		echo -e "\nPHASE EIGHT: Making Everything PI Again :)"
		echo -e "******************************************\n"

		echo -e "\n**** PHASE EIGHT Complete!!!! ****\n"
		echo -e "Everything should now be installed and setup correctly."
        echo -e "After loading RetroPie, use the \"Refresh\" rom listed in the Moonlight system."
		echo -e "To be safe, it's recommended that you perform a reboot now."
		echo -e "\nIf you don't want to reboot now, press N\n"
		
		read -p "Reboot Now (y/n)?" choice
		case "$choice" in 
		  y|Y ) shutdown -r now;;
		  n|N ) sudo bash ./Install.sh
		  ;;
		  * ) echo "invalid";;
		esac
	;;
	2)
		echo -e "\nInstalling Moonlight compatible themes"
		echo -e "***********************************************\n"
		
        sudo bash ./Install_themes.sh
		
		sudo bash ./Install.sh
	;;
    
	3)
		echo -e "\nRemove All Moonlight Launch Scripts"
		echo -e "***********************************\n"

		rm -rf /home/pi/RetroPie/roms/moonlight
		
		echo -e "\n**** Launch Script Removal Complete!!! ****"
		sudo bash ./Install.sh
	;;
	
	4) 
		echo -e "\nRe-Pair Moonlight with another PC"
		echo -e "*********************************\n"
		
		echo -e "Once you have input your PC's IP Address below, you will be given a PIN"
		echo -e "Input this on the PC to pair with Moonlight. \n"
		read -p "Input PC's IP Address here :`echo $'\n> '`" ip
		sudo -u pi moonlight pair $ip
		
		echo -e "\n**** Re-Pair Process Complete!!!! ****"
		sudo bash ./Install.sh
	;;

    5)  exit 1;;
		
	*) echo "INVALID NUMBER!" ;;
esac