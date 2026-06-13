{ config, pkgs, ... }:
{
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "bytomancer" ];

  users.extraGroups.plugdev.members = [ "bytomancer" ];

  # user
  users.users.bytomancer = {
    isNormalUser = true;
    description = "Bytomancer";
    extraGroups = [ "networkmanager" "wheel" "docker" "storage" "plugdev" ];
    packages = with pkgs; [
      fastfetch
      alacritty
      zellij
      neovim
      vscodium
      vesktop
      git
      picom
      feh
      xwinwrap
      mpv
      arandr
      pavucontrol
      fastfetch
      htop
      tealdeer
      killall
      libgcc
      gcc_multi
      go
      python3
      rustup
      rustc
      kitty
      pkg-config
      xinput_calibrator
      gnome-font-viewer
      fio
      stow
      cmus
      yt-dlp
      pipe-viewer
      v4l-utils
      kazam
      bc
      termusic

      thunderbird
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

      easyeffects

      discord
    ];
  };
}
