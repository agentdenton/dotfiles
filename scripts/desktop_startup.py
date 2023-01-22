#!/usr/bin/python

import os
import logging

def change_perms(config: dict[str, str]) -> None:
    assert config
    for path, perm in config.items():
        if os.path.exists(path):
            try:
                os.chmod(path, perm)
            except Exception as e:
                logging.error(f'Failed to change permission for {path}. {e}')
def main():
    logging.basicConfig(
        format='%(levelname)s: %(message)s',
        level=logging.ERROR,
    )

    sysfs_files = {
        '/sys/class/backlight/amdgpu_bl0/brightness': 0o0664,
        '/sys/class/leds/asus::kbd_backlight/brightness': 0o0664,
    }
    change_perms(sysfs_files)

if __name__ == '__main__':
    main()
