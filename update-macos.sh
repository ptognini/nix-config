#!/bin/bash
set -e
HOSTNAME=$(hostname)
   echo updating "$HOSTNAME"
nix flake update --commit-lock-file --extra-experimental-features "nix-command flakes"
nix build .#darwinConfigurations."$HOSTNAME".system --extra-experimental-features "nix-command flakes"
./result/sw/bin/darwin-rebuild switch --flake .
