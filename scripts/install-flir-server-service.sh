#!/bin/bash
echo ""
echo -e "\e[32m ############################################ \e[0m"
echo -e "\e[32m ###  Installing flir-server.service  ####### \e[0m"
echo -e "\e[32m ############################################ \e[0m"
DIR=/home/rov/git/FLIR_pubsub/scripts
clear
cd  $DIR ||   (echo -e "\e[31m [Failed]" ; exit)

echo -e "\e[32m ###  Stop existing service  ####### \e[0m"
sudo systemctl stop flir-server.service
sudo systemctl disable flir-server.service

echo -e "\e[32m ###  Copying files  ####### \e[0m"
mkdir /home/rov/logs
sudo cp $DIR/flir-server.service /etc/systemd/system/flir-server.service
sudo systemctl daemon-reload

echo -e "\e[32m ###  Start and enable  ####### \e[0m"
sudo systemctl start flir-server.service

sudo systemctl enable flir-server.service

echo -e "\e[32m ########################################## \e[0m"
echo -e "\e[32m #######   flir Camera Server info  ####### \e[0m"
echo -e "\e[32m ########################################## \e[0m"

sudo systemctl --no-pager status flir-server.service
