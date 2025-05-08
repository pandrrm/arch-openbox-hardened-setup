#!/bin/bash

# ========= CHECK =========
if ! grep -qi "arch" /etc/os-release; then
  echo "[ERROR] This script supports only Arch-based systems."
  exit 1
fi

# ========= INSTALL =========
echo "[+] Installing packages..."
sudo pacman -Syu --noconfirm openbox obconf xorg xorg-xinit alacritty tint2 nitrogen picom lxappearance

# ========= COPY CONFIG =========
echo "[+] Setting up config..."
mkdir -p ~/.config/{openbox,alacritty}
cp -r config/openbox/* ~/.config/openbox/
cp -r config/alacritty/* ~/.config/alacritty/
cp config/picom.conf ~/.config/

# ========= xinitrc =========
echo "exec openbox-session" > ~/.xinitrc

# ========= Wallpaper =========
mkdir -p ~/Pictures
cp wallpapers/default.jpg ~/Pictures/wall.jpg
nitrogen --set-zoom-fill ~/Pictures/wall.jpg --save

echo "[+] Done! Run 'startx' to enter Openbox desktop."
