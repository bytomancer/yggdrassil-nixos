{ pkgs, ... }:

{
  services.xserver = {
    enable = true;

    xkb.layout = "us";

    desktopManager.xterm.enable = false;

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks
      ];
    };

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
}
