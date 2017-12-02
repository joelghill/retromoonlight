#!/bin/bash

if [ ! -d /home/pi/RetroPie/roms/moonlight ] 
then
    mkdir -p /home/pi/RetroPie/roms/moonlight
fi

chmod -x+ Refresh.sh

/bin/cp ./Refresh.sh /home/pi/RetroPie/roms/moonlight/Refresh.sh
/bin/cp ./GenerateGamesList.py /home/pi/RetroPie/roms/moonlight/GenerateGamesList.py
