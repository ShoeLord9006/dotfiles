# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking = {
    hostName = "awoo-nixos"; # Define your hostname.
    useDHCP = false;
    interfaces.eno1.useDHCP = true;
    dhcpcd.enable = false;
    networkmanager.enable = true;
  };
  hardware.opengl.enable = true;

  fonts.fontconfig.defaultFonts.monospace = ["Source Code Pro"];
  fonts.fonts = with pkgs; [
    source-code-pro
    noto-fonts
    roboto
    symbola
    font-awesome_5
  ];

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
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hannah = {
    isNormalUser = true;
    extraGroups = [ "wheel" "systemd-journal" "networkmanager" "video" ]; # Enable ‘sudo’ for the user.
  };
  home-manager.users.hannah = { pkgs, ...}: {
    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs;[
      #Universal packages
      discord
      brave
      kitty
      spotify
      htop
      neofetch
      bash
      zsh
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
      xdg-utis
      #wofi
      #gtk-engine-murrine
      #gtk_engines
      #gsettings-desktop-schemas
      #lxappearance
    ];
    #wayland.windowManager.sway = {
    #  enable = true;
    #  wrapperFeatures.gtk = true;
    #};
    programs = {
      git = {
        enable = true;
        userName = "ShoeEater";
        userEmail = "blakeissmelly@gmail.com";
      };
    #  rofi = {
    #    enable = true;
    #    extraConfig = {
    #      modi = "window,run,ssh,combi";
    #      ssh-client = "ssh";
    #      ssh-command = "{terminal} -e \"{ssh-client} {host}\"";
    #      combi-modi = "window,drun,ssh";
    #    };
    #    terminal = "kitty";
    #  };
    };
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
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  time.timeZone = "Autsralia/Perth";
  
  system.stateVersion = "21.11"; # Did you read the comment?

}

