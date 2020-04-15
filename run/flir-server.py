import sys, os, time
from datetime import datetime
from  pathlib import Path
from setproctitle import setproctitle
PROCESS_NAME = 'flir-server'
HOME_DIR = '/home/rov/git/FLIR_pubsub'

sys.path.append(HOME_DIR)
from FLIR_pubsub import FLIR_server_utils as flir

import PySpin
import threading

def reset_cams():
    print('Reseting cameras')
    try:
        _SYSTEM = PySpin.System.GetInstance()
        # reset cameras
        cams = _SYSTEM.GetCameras()
        for cam in cams:
            cam.Init()
            print('cam', cam.GetUniqueID())
            cam.DeviceReset.Execute()
            del cam

        del cams
    except Exception as e:
        print(f'[Error]: {e}')

def run_cameras():
    print(f"Starting {PROCESS_NAME}: {datetime.now()}")

    _SYSTEM = PySpin.System.GetInstance()
    cams = _SYSTEM.GetCameras()

    if len(cams) == 0:
        print('[Error]: No cameras found')

    else:
        try:
            flir.register()
        except flir.multi_pyspin.CamArrival as e:
            print(e)

        dir_path = os.path.dirname(os.path.realpath(__file__))
        # dir_path = HOME_DIR
        yaml_dir = Path(f'{HOME_DIR}/run')
        try:
            flir.server(yaml_dir)
        except KeyboardInterrupt:
            # raise
            pass
        except Exception as e:
            print(f'[Error] jn1: {e}')
            raise

    # try:
    #     print('Reseting cameras')
    #     reset_cams()
    # except KeyboardInterrupt:
    #     raise
    # except Exception as e:
    #     print(e)
    #     raise

if __name__ == '__main__':
    setproctitle(PROCESS_NAME)
    try:
        run_cameras()
        time.sleep(2)
    except Exception as e:
        print(f'[Error] jn2: {e}')

