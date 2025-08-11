{ config, lib, pkgs, local, ... }:

{
  programs.git = {
    enable = true;
    
    userName = local.fullName;
    userEmail = local.email;
    
    extraConfig = {
      core.editor = local.editor;
      init.defaultBranch = "main";
    };
  };
}
