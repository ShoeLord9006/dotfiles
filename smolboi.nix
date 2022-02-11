# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.grub.device = "/dev/disk/by-id/ata-Mushkin_MKNSSDCL60GB-DX_MKN10330000002570";

  networking = {
    hostName = "smolboi"; # Define your hostname.
    domain = "daz.cat";
    useDHCP = false;
    #interfaces.eno1.useDHCP = true;
    wireless = {
      enable = true;
      networks = {
        traaaaaaannnnnnnnnns.pskRaw = "fb3c913b0c53916f8673e525ad74d7cfdc432b90e66544cbe6c9e10ccea7b5d0";
        traaaaaaannnnnnnnnns.authProtocols = [ "WPA-PSK" ];
      };
    };
    interfaces.wlp2s0.useDHCP = true;
    #networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Australia/Perth";

  services = {
    openssh.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    atool
    binutils
    pciutils
    p7zip
    unzip
    unrar
  ];

  system.stateVersion = "21.11"; # Did you read the comment?

}

