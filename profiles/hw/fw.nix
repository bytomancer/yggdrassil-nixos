{ config, pkgs, ... }:
{
  services.fwupd.enable = true;
  environment.systemPackages = with pkgs; [
    fwupd
    framework-tool
    # framework-tool-tui
  ];
}
