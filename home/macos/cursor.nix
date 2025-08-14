{ pkgs, config, local, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.code-cursor;
    mutableExtensionsDir = false;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # Vue extensions
        vue.volar

      ] ++ (if local.vimMode then [ vscodevim.vim ] else []);

      userSettings = {
        "extensions.autoUpdate" = false;
        "extensions.autoCheckUpdates" = false;
      };
    };
  };
}
