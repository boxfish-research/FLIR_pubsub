#!/bin/bash
cd  /home/rov/git/FLIR_pubsub
#nohup /home/rov/.virtualenvs/flir/bin/python -u run/flir-server.py  > /home/rov/logs/flir.log 2>&1 < /dev/null
/home/rov/.virtualenvs/flir/bin/python -u run/flir-server.py  > /home/rov/logs/flir.log 2>&1 < /dev/null
/home/rov/.virtualenvs/flir/bin/python -u run/reset-cams.py
