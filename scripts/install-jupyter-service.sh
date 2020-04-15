#!/bin/bash
echo -e "\e[32m ############################################ \e[0m"
echo -e "\e[32m ###  Installing jupyter notebook.service  ####### \e[0m"
echo -e "\e[32m ############################################ \e[0m"
DIR=/home/rov/git/FLIR_pubsub/scripts
cd  $DIR ||   (echo -e "\e[31m [Failed]" ; exit)

echo -e "\e[32m ###  Stop existing service  ####### \e[0m"
sudo systemctl stop jupyter.service
sudo systemctl disable jupyter.service

echo -e "\e[32m ########################################## \e[0m"
echo -e "\e[32m #######  Set jupyter pasword  ####### \e[0m"
echo -e "\e[32m ########################################## \e[0m"
/home/rov/.virtualenvs/flir/bin/jupyter notebook password

echo -e "\e[32m ###  Copying files  ####### \e[0m"
mkdir /home/rov/logs
sudo cp $DIR/jupyter.service /etc/systemd/system/jupyter.service
sudo systemctl daemon-reload

echo -e "\e[32m ###  Start and enable  ####### \e[0m"
sudo systemctl start jupyter.service
sudo systemctl enable jupyter.service

echo -e "\e[32m ########################################## \e[0m"
echo -e "\e[32m #######   jupyter status  ####### \e[0m"
echo -e "\e[32m ########################################## \e[0m"
sudo systemctl --no-pager status jupyter.service

