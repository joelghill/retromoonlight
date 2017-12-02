#!/bin/bash
moonlight list > gameslist.txt
python3 GenerateGamesList.py "./gameslist.txt"