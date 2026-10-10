default:
  ansible-playbook playbook.yml -K

setup:
  git submodule update --init --recursive

install_packages:
  ansible-playbook playbook.yml -K --tags packages

install_flatpaks:
  ansible-playbook playbook.yml -K --tags flathub

install_system:
  ansible-playbook playbook.yml -K --tags system

install_symlinks:
  ansible-playbook playbook.yml --tags symlinks

install_fonts:
  ansible-playbook playbook.yml --tags fonts

install_user:
  ansible-playbook playbook.yml -K --tags user

install_greetd:
  ansible-playbook playbook.yml -K --tags greetd
