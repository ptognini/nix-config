{ pkgs, config, lib, ... }:
{

# Enable the service for packet capturing
  services.dbus.enable = true;

  # Allow non-root users to capture packets
  security.wrappers = {
    dumpcap = {
      source = "${pkgs.wireshark}/bin/dumpcap";
      owner = "root";
      group = "wireshark";
      mode = "4710";
      capabilities = "cap_net_raw,cap_net_admin=eip";
    };
  };

  users.groups.wireshark = {};

 # Add your user to the wireshark group
  users.users.ptognini = {
    isNormalUser = true;
    extraGroups = [ "wheel" "wireshark" ]; # Add your user to the wireshark group
  };
}