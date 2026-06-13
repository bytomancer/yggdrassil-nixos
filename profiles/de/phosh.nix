{ config, libs, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.phosh = {
    enable = true;
    user = "bytomancer";
    group = "users";
    phocConfig.xwayland = "immediate";
};

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    phosh
    phoc
    squeekboard
    wl-clipboard
    networkmanagerapplet
    gnome-control-center
  ];

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
  };
}