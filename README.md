### Install

Install basic configurations:

```shell
git clone https://github.com/agentdenton/dotfiles.git
cd ~/.dotfiles/stow
stow -t ~ .
```

Initialize the private repo:

```shell
git submodule init && git submodule update
```
