{ config, pkgs, ... }:
{
  users.users.bytomancer = {
    isNormalUser = true;
    description = "Bytomancer";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      fastfetch
      alacritty
      zellij
      neovim
      git
      htop
      tealdeer
      killall
      stow
      emacs
      gnumake
      
      bat
      eza
      zoxide
      lazygit
      fzf
      ripgrep
      dysk
      dust
    ];
  };
}
