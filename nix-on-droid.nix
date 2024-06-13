{ inputs, outputs, config, lib, pkgs, username, homeDirectory, ... }:

{
  # Simply install just the packages
  environment.packages = with pkgs; [
    # User-facing stuff that you really really want to have
    vim # or some other editor, e.g. nano or neovim
    (nerdfonts.override { fonts = [ "Meslo" "DroidSansMono" ]; })
    zsh
    clang
    nodejs
    man
    sudo
    gzip
    zip
    unzip
    procps
    killall
    gnutar
    bzip2
    xz

    # Some common stuff that people expect to have
    #procps
    #killall
    #diffutils
    #findutils
    #utillinux
    #tzdata
    #hostname
    #man
    #gnugrep
    #gnupg
    #gnused
    #gnutar
    #bzip2
    #gzip
    #xz
    #zip
    #unzip
  ];

  user.shell = "${pkgs.zsh}/bin/zsh";

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "23.11";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Font pacakges
  terminal.font = "${pkgs.nerdfonts}/share/fonts/truetype/NerdFonts/MesloLGLDZNerdFont-Regular.ttf";
  # terminal.font = "${pkgs.terminus_font_ttf}/share/fonts/truetype/TerminusTTF.ttf";

  # Set your time zone
  #time.timeZone = "Europe/Berlin";

  # Configure home-manager
  home-manager.config = ./home-manager/home.nix;
  home-manager.extraSpecialArgs = { inherit inputs outputs username homeDirectory;};
}
