{ pkgs, ... }:

let
  libbluray = pkgs.libbluray.override {
    withAACS = true;
    withBDplus = true;
  };

  vlc = pkgs.vlc.override {
    inherit libbluray;
  };

  java = pkgs.jdk17_headless;

  blurayJar = "${libbluray}/lib/libbluray-j2se-1.3.4.jar";
in
{
  environment.systemPackages = [
    vlc
    libbluray
    pkgs.libaacs
    pkgs.libbdplus
    java
  ];

  environment.sessionVariables = {
    JAVA_HOME = "${java}";
    LIBBLURAY_CP = blurayJar;
  };
}
