#!/bin/bash

sudo NEEDRESTART_MODE=a apt install python3-pip -y &&
sudo pip install -r /home/ubuntu/webscraper/web-scraper-prod/requirements.txt &&
sudo export PASSWORD=zzvjdmwywnuzfyyi
sudo python3 /home/ubuntu/webscraper/web-scraper-prod/main.py

