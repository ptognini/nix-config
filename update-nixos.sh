#!/bin/sh

FLAG_FILE=./flake.lock

if [ ! -f "$FLAG_FILE" ] || [ "$(date -r $FLAG_FILE +%Y%m%d)" != "$(date +%Y%m%d)" ]; then
  nix flake update
fi
rm -rf $HOME/.config/xfce4/xfconf
rm -rf $HOME/.config/mimeapps.list
sudo nixos-rebuild --flake .#$(hostname) switch

