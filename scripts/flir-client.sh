#!/bin/bash
echo "Starting Flir Camera"

int_handler()
{
    echo "kill flir-client.py @ PID"  $pid
    kill $pid
#    echo "kill PID" $$
#    kill $$
    exit 1
}
trap 'int_handler' INT

cd  /home/rov/git/FLIR_pubsub
nohup /home/rov/.virtualenvs/flir/bin/python -u run/flir-client.py  > /dev/stdout &
pid=$(echo $!)
echo "PID OF flir-client.py  = "  $pid
# Wait untill interupt
while true
  do
      sleep 1
  done




