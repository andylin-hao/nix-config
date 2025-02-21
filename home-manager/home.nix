# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  username,
  homeDirectory,
  ...
}: 
{
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default
    (import ./apps/zsh { inherit lib pkgs username homeDirectory; })

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  home = {
    username = username;
    homeDirectory = homeDirectory;
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [ 
    git
    neovim
    fortune
    cowsay
    lsd
    ripgrep
    fd
    choose
    sd
    cheat
    openssh
    gping
    delta
    tree-sitter
    btop
    htop
    curl
    wget
    bat
    rclone
    zellij
    unar
    cmatrix
    sl
    nodejs
    dust
    glances
  ]; 

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";

  programs.jq = {
    enable = true;
  };

  programs.ssh = {
    serverAliveInterval = 240;
    serverAliveCountMax = 10;
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "Hao Lin";
    userEmail = "linhaomails@gmail.com";

    signing = {
      signByDefault = true;
      key = "${homeDirectory}/.ssh/id_ed25519.pub";
    };

    extraConfig = {
      gpg.format = "ssh";
    	core.pager = "delta";
	    delta.navigate = "true";
	    merge.conflictstyle = "diff3";
	    diff.colorMoved = "default";
	    pull.rebase = "true";
	    pull.ff = "only";
      credential.helper = "store";
    };
  };

  programs.neovim = {
    defaultEditor = true;
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.yazi;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.zoxide;
  };
}
