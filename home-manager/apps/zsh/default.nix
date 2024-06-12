{ lib, pkgs, ... }: {

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.zsh";
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
      plugins = [
        "fzf"
        "git"
	"sudo"
        "rust"
        "python"
        "pip"
        "systemd"
        "ssh-agent"
        "docker"
        "docker-compose"
        "history-substring-search"
      ];
      # extraConfig = "
      #   ";
    };

  };
}

