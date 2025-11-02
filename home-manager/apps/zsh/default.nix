{ lib, pkgs, username, homeDirectory, ... }: {

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = "fortune linux startrek | cowsay -ftux";

    localVariables = {
      ZSH_DISABLE_COMPFIX = if username == "root" then "true" else "false";
      PATH = if username == "yoda" then homeDirectory + "/Android/Sdk/platform-tools:$PATH" else "$PATH";
    };

    plugins = [
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "rclone_complete";
        src = pkgs.rclone;
        file = "share/zsh/site-functions/_rclone";
      }
    ];

    shellAliases = {
      ls = "lsd";
      lal = "lsd -al";
      ll = "lsd -l";
      cd = "z";
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
      	"sudo"
        "rust"
        "python"
        "pip"
        "systemd"
        "docker"
        "docker-compose"
        "history-substring-search"
      ];
      # extraConfig = "
      #   ";
    };

  };
}

