#!/bin/bash

int_handler()
{
    echo "Interrupted."
    # Kill the parent process of the script.
#    kill $PPID
    echo $(jobs -p)
#    exit 1
}
trap 'int_handler' INT

while true; do
    sleep 5
    echo "I'm still alive!"
done

# We never reach this part.
exit 0