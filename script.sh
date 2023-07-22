#!/bin/bash

sudo apt-get update
sudo NEEDRESTART_MODE=a apt-get upgrade -y
sudo apt install git -y

mkdir /home/ubuntu/webscraper
cd /home/ubuntu/webscraper
git clone https://github.com/jamesbarker15/web-scraper-prod.git
sudo NEEDRESTART_MODE=a apt install python3-pip -y
sudo pip install -r /home/ubuntu/webscraper/web-scraper-prod/requirements.txt
cd /home/ubuntu/webscraper/web-scaper-prod
sudo python3 main.py


