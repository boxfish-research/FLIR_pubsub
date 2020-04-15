#!/bin/bash

echo -e "\e[32m ########################################## \e[0m"
echo -e "\e[32m #######   flir Camera Server info  ####### \e[0m"
echo -e "\e[32m ########################################## \e[0m"

sudo systemctl --no-pager status flir-server.service
