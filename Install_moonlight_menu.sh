#!/bin/bash

echo -e "\nCreating Moonlight Menu for RetroPie..."
		
CONFIG=$(<./menu_config.txt)
DIRECTORY=/home/pi/.emulationstation/es_systems.cfg

if [ -f $DIRECTORY ]
then	
    echo -e "Removing Duplicate Systems File"
    rm $DIRECTORY
fi

echo -e "Copying Systems Config File"
cp /etc/emulationstation/es_systems.cfg $DIRECTORY
    
if grep -q  "$CONFIG" $DIRECTORY; then
    echo -e "NOTE: Moonlight Entry Exists - Skipping"
else
    echo -e "Adding Steam to Systems"
    sed
    sudo sed -i -e 's|</systemList>| /r ./menu_config.txt' $DIRECTORY
fi

echo -e "\nMoonlight menue added to RetroPie..."