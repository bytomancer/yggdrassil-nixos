{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  programs.gamemode.enable = true;

  services.flatpak.enable = true;
  services.input-remapper.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      kdePackages.xdg-desktop-portal-kde
    ];
  };
  xdg.portal.config.common.default = "*";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
    ];
  };

  # input-remapper removed here since services.input-remapper handles it
  environment.systemPackages = with pkgs; [ ];

  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ 10501 ];
      allowedUDPPorts = [ 10501 ];
    };
  };
}