#!/bin/bash

echo -e "\nCreating Refresh script in Moonlight..."

if [ -d /home/pi/RetroPie/roms/moonlight ] 
then
    rm -rf /home/pi/RetroPie/roms/moonlight
fi

mkdir -p /home/pi/RetroPie/roms/moonlight

chmod a+x ./Scripts/Refresh.sh
/bin/cp ./Scripts/Refresh.sh /home/pi/RetroPie/roms/moonlight/Refresh.sh
/bin/cp ./GenerateGamesList.py /home/pi/RetroPie/roms/moonlight/GenerateGamesList.py

chmod 777 /home/pi/RetroPie/roms/moonlight

echo -e "Refresh script has been added to RetroPie\n"
echo -e "After loading RetroPie, use the \"Refresh\" rom listed in the Moonlight system.\n"
