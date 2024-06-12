{ lib, pkgs, ... }: {

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

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

