#!/bin/bash

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
