 { config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    wl-clipboard
    mako
    sway-contrib.grimshot
    dmenu
    i3status
    nautilus
    gnome-keyring
    libsecret
    slurp
  ];

  # GNOME Keyring
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  xdg.portal.wlr.settings.screencast = {
    chooser_type = "simple";
    chooser_cmd = "${pkgs.slurp}/bin/slurp -f 'Monitor: %o' -or";
  };


  # Greeter
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --cmd sway";
        user = "greeter";
      };
    };
  };

  # XDG portals: file pickers, screenshots, and screencasting
  xdg.portal = {
    enable = true;
    wlr.enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];

    config = {
      sway = {
        default = [ "gtk" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      };
    };
  };
  
  # Required for Wayland screen sharing
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
} 
