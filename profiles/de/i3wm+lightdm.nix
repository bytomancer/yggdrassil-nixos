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

        kdePackages.qtsvg
        kdePackages.kio
        kdePackages.kio-fuse
        kdePackages.kio-extras
        kdePackages.dolphin

        # libva
        kdePackages.spectacle

        nautilus
      ];
    };

    displayManager.lightdm.enable = true;
    displayManager.lightdm.greeters.slick.enable = true;
  };

  environment.pathsToLink = [ "/libexec" ];
}
