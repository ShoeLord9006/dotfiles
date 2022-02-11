{ config, pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [
        #General Packages
        discord
        brave
        kitty
        spotify
        htop
        neofetch
        bash
        zsh
        #Gui utils
        networkmanagerapplet
        pavucontrol
        #Gui
        swayidle
        sway
        wl-clipboard
        mako
        rofi
        waybar
        slurp
        grim
    ];
}
