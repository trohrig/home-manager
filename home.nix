{ config, pkgs, ... }:

{

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tom";
  home.homeDirectory = "/home/tom";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    devilspie2
    discord
    mattermost-desktop
    spotify
    typst
    vscodium
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    "${config.xdg.configHome}/autostart/devilspie2.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Exec=devilspie2
      Name=Devilspie2
      X-GNOME-Autostart-enabled=true
    '';

    # Layout rules for devilspie2
    ".config/devilspie2/layout.lua".text = ''
      -- Discord: workspace 1, left half
      if (get_window_name() == "Discord") then
        set_window_workspace(1)
        set_window_geometry(0, 0, 1280, 1440)
      end

      -- Spotify: workspace 1, right half
      if (get_window_name() == "Spotify") then
        set_window_workspace(1)
        set_window_geometry(1280, 0, 1280, 1440)
      end

      -- VSCodium: workspace 2, fullscreen
      if (get_window_name() == "VSCodium") then
        set_window_workspace(2)
        maximize()
      end

      -- Firefox: workspace 3, fullscreen
      if (get_window_name() == "Firefox") then
        set_window_workspace(3)
        maximize()
      end

      -- Alacritty: workspace 4, fullscreen
      if (get_window_name() == "Alacritty") then
        set_window_workspace(4)
        maximize()
      end
    '';
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/tom/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
