# RetroPie Moonlight #

This is a set of scripts with the intent of helping people stream games from their PC to their RetroPie. These scripts use [Moonligh](http://moonlight-stream.com/) to query your PC for your available games and generates a "Console" within RetroPi along with a set of "Roms" representing your games. Each rom is actually a shell script configured to tell moonlight to begin streaming the game of your choice.
![alt text](https://github.com/joelghill/retromoonlight/blob/master/Images/menu_eudora.png "Moonlight game collection in Eudora theme")

## Why Use This? ##

There is already a [solution available](https://github.com/TechWizTime/moonlight-retropie) for streaming Steam Big Picture Mode, why bother using this? There are a few reasons:

  1. Using this script RetroPie will have a list of games it can display with scraped meta-data from the web.
  2. I've found Steam BPM to be unreliable when used with RetroPie and I wanted something better.

## Setup ##

Follow this guide: [https://github.com/TechWizTime/moonlight-retropie](https://github.com/TechWizTime/moonlight-retropie)

Then, on your raspberry pi:

  1. git clone https://github.com/joelghill/retromoonlight.git
  
  2. cd retromoonlight
  
  3. sudo bash ./Install.sh

## Usage ##
Emulationstation should now have an entry for Steam (should maybe rename). There will be a single "Rom" called refresh. Use this to update your games list. After using refresh command you will need to reboot emulationstation.

## Credits ##

A huge thank you to [TechWizTime](https://github.com/TechWizTime) for his work in creating the install and setup script for moonlight in RetroPie. I am building on his work and could not have developed this without following his example!



