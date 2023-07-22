#!/bin/bash

cd /home/ubuntu/webscraper/web-scraper-prod &&
sudo NEEDRESTART_MODE=a apt install python3-pip -y &&
sudo pip install -r requirements.txt &&
sudo python3 main.py

