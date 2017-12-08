#!/bin/bash

echo -e "\nCreating Refresh script in Moonlight..."

if [ -d /home/pi/RetroPie/roms/moonlight ] 
then
    rm -rf /home/pi/RetroPie/roms/moonlight
fi

mkdir -p /home/pi/RetroPie/roms/moonlight
chmod 775 /home/pi/RetroPie/roms/moonlight
chown pi:pi /home/pi/RetroPie/roms/moonlight

chmod -x+ Refresh.sh

/bin/cp ./Refresh.sh /home/pi/RetroPie/roms/moonlight/Refresh.sh
/bin/cp ./GenerateGamesList.py /home/pi/RetroPie/roms/moonlight/GenerateGamesList.py

echo -e "Refresh script has been added to RetroPie\n"
echo -e "After loading RetroPie, use the \"Refresh\" rom listed in the Moonlight system.\n"
