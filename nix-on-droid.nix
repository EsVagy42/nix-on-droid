{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Simply install just the packages
  environment.packages = with pkgs; [
    git
    vim
    libqalculate
    nushell

    lldb
    gcc
    gdb
    clang-tools
    nixd
    nixfmt-rfc-style
    marksman
    kdePackages.markdownpart
    lua
    lua-language-server
    cppcheck
    cargo
    rustc
    rustfmt
    nixos-shell
    python3

    haskell.compiler.ghcHEAD
    powershell

    pandoc
    texliveFull

    yt-dlp
  ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  home-manager.config = ./home.nix;

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Set your time zone
  #time.timeZone = "Europe/Berlin";
}
