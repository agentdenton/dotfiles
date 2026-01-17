pacman_packages_list := " \
  helix \
  neovim \
  wezterm \
  lazygit \
  lazydocker \
  git \
  fish \
  direnv \
  man-db \
  man-pages \
  zoxide \
  ripgrep \
  bat \
  fd \
  eza \
  starship \
  yazi \
  fzf \
  jq \
  yq \
  tldr \
  firefox \
  curl \
  net-tools \
  bind \
  bluez \
  networkmanager \
  sshfs \
  wireguard-tools \
  wl-clipboard \
  7zip \
  unzip \
  alsa-utils \
  restic \
  kdeconnect \
  flatpak \
  rsync \
  mpv \
  bottom \
  arp-scan \
  papirus-icon-theme \
  cosmic \
  tailscale \
  ttf-iosevka-nerd \
  ttf-jetbrains-mono \
  ttf-jetbrains-mono-nerd \
  otf-comicshanns-nerd \
  ttf-font-awesome \
  noto-fonts-cjk \
"

flatpaks_list := " \
  org.signal.Signal \
  org.kde.okular \
  org.kde.neochat \
  im.riot.Riot \
  org.localsend.localsend_app \
  org.kde.gwenview \
  com.valvesoftware.Steam \
  com.valvesoftware.SteamLink \
  com.github.tchx84.Flatseal \
  md.obsidian.Obsidian \
  org.keepassxc.KeePassXC \
  org.kde.krita \
  org.kde.ktorrent \
  com.anydesk.Anydesk \
  com.obsproject.Studio \
  org.raspberrypi.rpi-imager \
  com.discordapp.Discord \
"

default:
  @just --list

install: install_pacman_packages install_flatpaks install_scripts install_dotfiles

install_dotfiles:
  mkdir -p ~/.config
  cd ./stow && stow -t ~ .

install_scripts:
  sudo mkdir -p /usr/local/bin
  sudo rsync -avh ./scripts/ /usr/local/bin

install_pacman_packages:
  sudo pacman -Syu --noconfirm
  echo {{pacman_packages_list}} | xargs sudo pacman -S --needed --noconfirm

install_flatpaks:
  echo {{flatpaks_list}} | xargs flatpak install -y flathub
