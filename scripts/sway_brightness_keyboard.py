#!/usr/bin/python

import sys
import logging

MAX_BRIGHTNESS = 3
MIN_BRIGHTNESS = 0

def main():
    logging.basicConfig(level=logging.ERROR,
                        format='%(levelname)s: %(message)s')

    if len(sys.argv) < 2:
        logging.error('No arguments provided')
        sys.exit(1)

    br = sys.argv[1]
    logging.info(f'arg brightness value = {br}')

    fdpath = '/sys/class/leds/asus::kbd_backlight/brightness'
    with open(fdpath, 'r+') as fd:
        cur_br = int(fd.readline())
        logging.info(f'current brightness = {cur_br}')

        if br.startswith('+'):
            br = cur_br + int(br.split('+')[1])
        elif br.startswith('-'):
            br = cur_br - int(br.split('-')[1])
        else:
            br = int(br)

        if br > MAX_BRIGHTNESS:
            br = MIN_BRIGHTNESS

        if br < MIN_BRIGHTNESS:
            br = MIN_BRIGHTNESS

        fd.write(str(br) + '\n')

    logging.info(f'Succes. Brightness changed to {br}')
    sys.exit(0)

if __name__ == '__main__':
    main()
