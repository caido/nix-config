# nix-config

Single repo to bootstrap macOS, NixOS, and non-NixOS Linux with Nix.  


## Quickstart (macOS first run)

### macOS

1. Install Nix + enable flakes

```bash
xcode-select --install || true
sh <(curl -L https://nixos.org/nix/install) --daemon
```

2. Setup system 

```bash
sudo nix run \
  --extra-experimental-features 'nix-command flakes' \
  nix-darwin -- switch \
  --flake ./#macos
```

3. Setup home

```bash
home-manager switch --flake .#user@macos
```

## Rebuilding

### macOS

```bash
# Rebuild system
sudo darwin-rebuild switch --flake ./#macos

# Rebuild user
home-manager switch --flake .#user@macos
```
