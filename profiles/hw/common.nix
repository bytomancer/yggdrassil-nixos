{ pkgs, ... }:

{
  hardware.keyboard.qmk.enable = true;
  services.udev.packages = [ pkgs.via ];
  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';

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
