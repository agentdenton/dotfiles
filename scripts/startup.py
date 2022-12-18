#!/usr/bin/python

import os
import sys
import time

descriptors = [
    '/sys/class/backlight/amdgpu_bl0/brightness',
    '/sys/class/leds/asus::kbd_backlight/brightness',
]

def main():
    timeout = 0
    while True:
        for desc in descriptors.copy():
            if os.path.exists(desc.strip()):
                try:
                    os.chmod(desc, 0o666)
                except Exception:
                    pass
                else:
                    descriptors.remove(desc)

        if len(descriptors) == 0 or timeout == 5:
            print('Startup exit success')
            sys.exit(0)

        if timeout == 5:
            print('Startup exit failure')
            sys.exit(1)

        timeout += 1
        time.sleep(1)


if __name__ == '__main__':
    main()
