{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../../profiles/base.nix

      ../../profiles/de/locale.nix

      ../../users/bytomancer-minimal.nix

      ../../profiles/servers/nginx-reverse-proxy.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "Hofund";

  services.openssh.enable = true;
  
  system.stateVersion = "25.05";
}
