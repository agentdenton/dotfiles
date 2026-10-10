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
just
```

## Roles

Run only some roles:

```shell
ansible-playbook playbook.yml --tags symlinks,fonts
ansible-playbook playbook.yml -K --skip-tags packages
```
## Private repo

Initialize the private submodule:

```shell
git submodule init && git submodule update
```
