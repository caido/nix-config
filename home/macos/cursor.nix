{ pkgs, config, local, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.code-cursor;
    mutableExtensionsDir = false;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        vue.volar
        dbaeumer.vscode-eslint
      ] ++ (if local.vimMode then [ vscodevim.vim ] else []);

      userSettings = {
        "extensions.autoUpdate" = false;
        "extensions.autoCheckUpdates" = false;
      };
    };
  };
}
