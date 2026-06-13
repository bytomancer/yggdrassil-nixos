{ pkgs, ... }:

{
  networking.networkmanager.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  environment.pathsToLink = [ "/libexec" ];

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
