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

      ../../profiles/dev/docker.nix

      ../../profiles/xiv.nix

      ../../users/bytomancer.nix
    ];

  networking.hostName = "Naglfar";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
