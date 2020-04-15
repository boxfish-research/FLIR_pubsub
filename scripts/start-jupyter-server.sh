#!/bin/bash
cd ~  # so jupyter starts in /home/rov
IP=0.0.0.0
nohup /home/rov/.virtualenvs/flir/bin/jupyter-notebook --ip $IP --port 8888 --config=/home/rov/.jupyter/jupyter_notebook_config.py > /home/rov/logs/jupyter.log 2>&1 < /dev/null
