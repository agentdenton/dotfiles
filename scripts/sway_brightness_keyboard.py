#!/usr/bin/python

import sys

def main():
    fpath = '/sys/class/leds/asus::kbd_backlight/brightness'
    with open(fpath, 'r+') as f:
        curr_br = int(f.readline())

        if len(sys.argv) > 1:
            value = sys.argv[1]
            print(f'argument value = {value}')

            if value.startswith('+'):
                next_br = curr_br + int(value.split('+')[1])
            elif value.startswith('-'):
                next_br = curr_br - int(value.split('-')[1])
            else:
                next_br = int(value)

            print(f'current brightness = {curr_br}')
            print(f'next brightness = {next_br}')

            if next_br <= 3 and next_br >= 0:
                f.write(str(next_br) + '\n')

if __name__ == '__main__':
    main()
