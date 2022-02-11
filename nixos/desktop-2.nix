# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "zfs" ];

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking = {
    hostName = "Windows-9"; # Define your hostname.\
    domain = "daz.cat";
    hostId = "b5651085";
    useDHCP = false;
    interfaces.eno1.useDHCP = true;
    dhcpcd.enable = false;
    networkmanager.enable = true;
  };
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  fonts.fontconfig.defaultFonts.monospace = ["Source Code Pro"];
  fonts.fonts = with pkgs; [
    source-code-pro
    noto-fonts
    roboto
    symbola
    font-awesome_5
    terminus_font
  ];
  console.font = "Lat2-Terminus16";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  #services.xserver.enable = true;
  #services.xserver.windowManager.i3.enable = true;
  #services.xserver.windowManager.i3.package = pkgs.i3-gaps;
  #services.compton.enable = true;


  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services = {
    printing.enable = true;
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).

  users.groups = { ##### NFS Compatability with storage.daz.cat
    hannah = { gid = 13000; };
    delanria = { gid = 1003; }; # - TODO - Update GID on storage
  };
  environment.extraInit = "umask 002";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hannah = {
    isNormalUser = true;
    extraGroups = [ "wheel" "systemd-journal" "networkmanager" "video" ] ++ [ "hannah" "delanria" ];
# "hannah" "_saadarr" "qbittorrent" "delanria" ]; # hannah _saadarr qbittorrent delanria are all part of storage.daz.cat
    ###### NFS Compatability with storage.daz.cat
    uid = 13000;
        ######
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6r80DpbFhNaptSs43JvgK1UiOL8LmLodPsSIHq8dGsKO+HJgAZBq1TWdTKpcP/9ZTDDRu3l2uBR+GJ616t+KlW+QhfdGuva2q0iRPGUETE7xR1q8Mw9zwcnBjyE2JsBIPK+P+fgkO2h6sX8n3Xp8RZR4pbmaxkLWJiBum5L7U8D/+Ic+Fh3+n1QVa8Op6yRCxNIQliD688unOjHzOdWtJIL/JNUt52T/9dgGodZY6Wsk+kWZNjWOteNAXuzS4kHWv53RL1ZPo9yG0ihcQeRuN0kqsVlycv+w0s1Rqo85xdXd/Zv53tqHkroWd5iI70vjCwiQh1PMPSZEezKBl2vCvqLvm7marjCRbslxjxdX8XL467+6Y+2HBIFGkziT8rDn81dhak1LbyL7m7qFIMAFOtPbXHpHLboM9U7dhC/QdE/r3c0h3Hn5wxM6JlEfClnC4YJV7qG01Kszm0dNTr99XlErr+2kHXwJUDB9fh/V0Ob4+CribP9IX29rkCP4SouU="
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      #Universal packages
      discord
      brave
      kitty
      spotify
      htop
      neofetch
      bash
      zsh
      fzf #ZSH PLUGIN
      #direnv #ZSH PLUGIN
      sshfs
      mosh
      steam
      steam-run
      #Gui utils
      pavucontrol
      networkmanagerapplet
      #WM/DE Packages
      sway
      swayidle
      wl-clipboard
      mako
      rofi
      waybar
      slurp
      grim
      xdg-utils
      stow
      #wofi
      #gtk-engine-murrine
      #gtk_engines
      #gsettings-desktop-schemas
      #lxappearance
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vimHugeX
    wget
    git
    nix-index
    atool
    binutils
    pciutils
    p7zip
    unzip
    unrar
    nfs-utils
  ];

  nixpkgs.config.allowUnfree = true;

  boot.cleanTmpDir = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    light.enable = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services = {
    openssh.enable = true;
    #rpcbind.enable = true;
  };

  fileSystems."/mnt/ocean" = {
    device = "storage.home.daz.cat:/ocean";
    fsType = "nfs";
    options = [ "soft" "bg" ];
  };
  #fileSystems."/mnt/hannah-private-ocean" = {
  #  device = "storage.home.daz.cat:/ocean/private/hannah";
  #  fsType = "nfs";
  #  #options = ["noauto"];
  #};

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  time.timeZone = "Australia/Perth";

  system.stateVersion = "21.11"; # Did you read the comment?

}

