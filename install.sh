#!/bin/bash
sudo cp rand.sh /usr/local/bin/
sudo cp script.sh /usr/local/bin/
sudo cp *.service /etc/systemd/system/
cd /etc/systemd/system
sudo systemctl disable sleepscript.service wakescript.service startscript.service
sudo systemctl enable sleepscript.service wakescript.service startscript.service
