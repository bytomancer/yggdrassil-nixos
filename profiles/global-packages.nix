{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    udisks
    udiskie
    gnome-disk-utility
    udevil
    gvfs
    rofi
    fw-ectool
    bluez-experimental
    blueman
    solaar
  ];

  programs.firefox.enable = true;
}
