{lib, ...}:
with lib; {
  config = {
    # enable openssh on server in vm
    services.openssh.enable = mkDefault true;

    networking.firewall.allowedTCPPorts = [22 8765 8764];
  };
}
