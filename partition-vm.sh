#!/bin/sh
# set -x
set -e

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

read -p "Please enter the destination storage device (sda,vda,nvme01): " user_input

# Echo the input back
echo "NixOS will be installed to /dev/$user_input. Continue (y/n): "

# Ask for confirmation
while true; do
    read -p "Do you wish to proceed? (yes/no) " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo "Exiting."; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Continue with the rest of the script
echo "Creating partitions."
# ... rest of your script
# Rest of your script...
echo creating partitions...
parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart primary 512MB -8GB
parted /dev/sda -- mkpart primary linux-swap -8GB 100%
parted /dev/sda -- mkpart ESP fat32 1MB 512MB
parted /dev/sda -- set 3 esp on

echo "Formatting partitions."
mkfs.ext4 -L nixos /dev/sda1
mkswap -L swap /dev/sda2
mkfs.fat -F 32 -n boot /dev/sda3
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot
swapon /dev/sda2

echo "Generating config."
nixos-generate-config --root /mnt


