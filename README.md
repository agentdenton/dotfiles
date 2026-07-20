## Install

Prerequisites:

```shell
# Fedora
sudo dnf install ansible

# Arch Linux
sudo pacman -S ansible
```

Install everything on a brand new system:

```shell
git clone https://github.com/agentdenton/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
ansible-playbook playbook.yml -K
```

Initialize the private repo:

```shell
git submodule init && git submodule update
```
