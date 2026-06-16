{ pkgs, ... }:

{
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services.hardware.bolt.enable = true;

  services.printing.enable = true;

  # Auto-mount disks
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.devmon.enable = true;
  
  environment.systemPackages = [
    pkgs.udiskie
    pkgs.wget
    pkgs.git
    pkgs.unzip
  ];
  
  security.sudo.extraConfig = ''
    Defaults timestamp_timeout=30
  '';
}
