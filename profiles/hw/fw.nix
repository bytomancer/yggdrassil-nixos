{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fwupd
    framework-tool
    # framework-tool-tui
  ];
}
