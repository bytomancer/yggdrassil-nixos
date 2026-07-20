{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../../profiles/base.nix
      ../../profiles/bootloader.nix
      ../../profiles/global-packages.nix

      ../../profiles/hw/nvidia.nix
      ../../profiles/hw/common.nix
      ../../profiles/hw/audio.nix

      ../../profiles/de/locale.nix
      ../../profiles/de/kde+plasma.nix

      ../../profiles/steam.nix
      ../../profiles/xiv.nix

      ../../users/bytomancer.nix
    ];

  networking.hostName = "Hrotti";

  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  system.stateVersion = "25.05";
}
