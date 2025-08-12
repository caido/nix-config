{ pkgs, config, local, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.code-cursor;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      # Vue extensions
      vue.volar

    ] ++ (if local.vimMode then [ vscodevim.vim ] else []);
  };
}
