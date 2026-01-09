### Install

Install basic configurations:

```shell
git clone https://github.com/agentdenton/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Install everything on a brand new system (flatpaks, pacman packages, scritps, etc.)
just install

# Just install dotfiles
just install_dotfiles
```

Initialize the private repo:

```shell
git submodule init && git submodule update
```
