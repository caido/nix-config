# nix-config

Single repo to bootstrap macOS, NixOS, and non-NixOS Linux with Nix.  

## Quickstart (macOS first run)

### macOS

1. Install Nix + enable flakes

```bash
xcode-select --install || true
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --determinate
exec "$SHELL" -l
```

2. Setup system

```bash
sudo nix run \
  --extra-experimental-features 'nix-command flakes' \
  nix-darwin -- switch \
  --flake ./#macos
```

3. Update the nix.local

Update the nix.local with the correct username, email and additional config changes you'd like.

4. Setup home

```bash
home-manager switch --flake .#user@macos
```

Reload your terminal. You should now see a new zshrc prompt showing that the home-manager's dotfiles are loaded.

## Rebuilding

### macOS

```bash
# Rebuild system
sudo darwin-rebuild switch --flake ./#macos

# Rebuild user
home-manager switch --flake .#user@macos
```
