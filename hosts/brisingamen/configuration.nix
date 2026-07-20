{ config, pkgs, ... }:

{
  imports =
    [
      <nixos-hardware/microsoft/surface/surface-pro-intel>
      ./hardware-configuration.nix

      ../../profiles/base.nix
      ../../profiles/bootloader.nix
      ../../profiles/global-packages.nix

      ../../profiles/hw/common.nix
      ../../profiles/hw/audio.nix

      ../../profiles/de/locale.nix
      ../../profiles/de/kde+plasma.nix

      ../../profiles/dev/docker.nix

      ../../users/bytomancer.nix
    ];

  networking.hostName = "Brisingamen";

  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    maliit-keyboard
  ];

  system.stateVersion = "25.05";
}
