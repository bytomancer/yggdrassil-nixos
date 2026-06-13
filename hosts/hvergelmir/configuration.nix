{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../../profiles/base.nix

      ../../profiles/dev/docker.nix

      ../../users/bytomancer-minimal.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "Hvergelmir";

  system.stateVersion = "25.05";
}
