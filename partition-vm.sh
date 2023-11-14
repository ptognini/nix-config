#!/bin/sh
# set -x
set -e

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


device=$(lsblk -o NAME,MOUNTPOINT | awk '$2==""{print $1}')
num_devices=$(echo "$device" | wc -l)

if [ "$num_devices" -gt 1 ]; then
    echo "More than one unused device found."
    echo $device

    read -p "Please enter the destination storage device: " device < /dev/tty
fi

while true; do
    read -p "NixOS will be installed to /dev/$device. Proceed (y/n)? " yn < /dev/tty
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo "Exiting."; exit;;
        * ) echo "Please answer y or n.";;
    esac
done

parted "/dev/${device}" --script -- 'print' | awk '/^ [0-9]+/{print $1}' | while read part; do
    parted "/dev/${device}" --script -- rm "$part"
done

echo "Creating partitions" 
parted "/dev/${device}" -- mklabel gpt --script
parted "/dev/${device}" -- mkpart primary 512MB -8GB --script
parted "/dev/${device}" -- mkpart primary linux-swap -8GB 100% --script
parted "/dev/${device}" -- mkpart ESP fat32 1MB 512MB --script
parted "/dev/${device}" -- set 3 esp on --script

echo "Formatting partitions"
mkfs.ext4 -L nixos "/dev/${device}1"
mkswap -L swap "/dev/${device}2"
mkfs.fat -F 32 -n boot "/dev/${device}3"
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot
swapon "/dev/${device}2"

#echo "Generating config."
#nixos-generate-config --root /mnt

nix-env -iA nixos.git
nix-env -iA nixos.nixFlakes

git clone https://github.com/andreaugustoaragao/nix-config#utm-dev
cd nix-config
nixos-install --flake .#utm-dev

