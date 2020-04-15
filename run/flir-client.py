import argparse, sys
from  pathlib import Path
sys.path.append('/home/rov/git/FLIR_pubsub')
from FLIR_pubsub import FLIR_client_utils as flir
from setproctitle import setproctitle
PROCESS_NAME = 'flir-client'
# construct the argument parse and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-u", "--url", default='localhost',
	help="url path to flir server")
ap.add_argument("-n", "--name", default='FrontLeft',
	help="name of the camera, FrontLeft, FrontRight, BackLeft, BackRight ")

args = vars(ap.parse_args())

if __name__ == '__main__':
    setproctitle(PROCESS_NAME)
    print(f'Connecting to {args["name"]} on {args["url"]}')
    flir.client(name=args["name"], url=args["url"])

