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
        bradlc.vscode-tailwindcss
        davidanson.vscode-markdownlint
        graphql.vscode-graphql-syntax
        aaron-bond.better-comments
      ] ++ (if local.vimMode then [ vscodevim.vim ] else []);

      userSettings = {
        "extensions.autoUpdate" = false;
        "extensions.autoCheckUpdates" = false;
        "editor.codeActionsOnSave" = {
          "source.fixAll" = "explicit";
        };
        "vue.inlayHints.destructuredProps" = true;
        "vue.inlayHints.inlineHandlerLeading" = true;
      };
    };
  };
}
