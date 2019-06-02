#!/bin/bash

echo -e "\nPairing Moonlight with another PC...\n"
echo -e "Once you have input your PC's IP Address below, you will be given a PIN"
echo -e "Input this on the PC to pair with Moonlight. \n"
read -p "Input PC's IP Address here :`echo $'\n> '`" ip
sudo -u pi moonlight pair $ip		
echo -e "Pair Process Complete."	