{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../../profiles/base.nix
      ../../profiles/bootloader.nix
      ../../profiles/global-packages.nix

      ../../profiles/hw/common.nix
      ../../profiles/hw/audio.nix
      ../../profiles/hw/fw.nix

      ../../profiles/de/locale.nix
      ../../profiles/de/i3wm+lightdm.nix

      ../../profiles/steam.nix

      ../../profiles/dev/podman.nix

      ../../users/bytomancer.nix
    ];

  networking.hostName = "Hringhorni";

  system.stateVersion = "25.05";
}
