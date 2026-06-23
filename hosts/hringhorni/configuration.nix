{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../../profiles/base.nix
      ../../profiles/bootloader.nix
      ../../profiles/global-packages.nix

      ../../profiles/hw/audio.nix

      ../../profiles/de/locale.nix
      ../../profiles/de/i3wm+gdm.nix

      ../../profiles/steam.nix

      ../../profiles/dev/docker.nix

      ../../users/bytomancer.nix
    ];

  networking.hostName = "Hringhorni";

  environment.pathsToLink = [ "/libexec" ];

  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  system.stateVersion = "25.05";
}
