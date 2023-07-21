#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt install git -y

mkdir /home/ubuntu/webscraper
cd /home/ubuntu/webscraper
git clone https://github.com/jamesbarker15/web-scraper-prod.git
cd /home/ubuntu/webscraper/web-scraper-prod
sudo NEEDRESTART_MODE=a apt install python3-pip -y
sudo pip install -r requirements.txt
sh export PASSWORD="zzvjdmwywnuzfyyi"
python3 main.py

