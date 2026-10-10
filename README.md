## Install

Prerequisites:

```shell
# Fedora
sudo dnf install ansible just

# Arch Linux
sudo pacman -S ansible just
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

Initialize and download the private submodule:

```shell
just setup
```
