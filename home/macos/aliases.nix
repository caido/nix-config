{ pkgs, ... }:
{
  home.shellAliases = {
    # Navigation
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "....." = "cd ../../../..";
    
    # macOS specific
    cleanup = "find . -name '.DS_Store' -type f -delete";
    
    # Network
    myip = "curl -s https://ipinfo.io/ip";
    ports = "lsof -i -P -n | grep LISTEN";
    
    # Quick access to common directories
    p = "cd ~/Projects";

    # Overwrites
    grep = "rg";
    ls = "eza";
  };
}
