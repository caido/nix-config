{
  # REQUIRED
  system   = "aarch64-darwin";   # e.g. "x86_64-darwin", "x86_64-linux", "aarch64-linux"
  username = "corb3nik";
  fullName = "Ian Bouchard";
  email    = "ian@atvh.dev";

  # OPTIONAL (safe defaults)
  shell   = "zsh";               # "zsh" | "bash" | "fish"
  editor  = "vim";               # "cursor" | "nvim" | "vim"
  gitSign = false;               # set true later when we wire 1Password SSH signing
}
