# Yggdrassil NixOS Configurations
This project collects the NixOS configurations for all my personal servers and computers.

## Setup
[Setup Guide](SETUP.md)

## Usage
Check out the repo to a home directory as your current user:
```bash
cd ~ && git clone git@github.com:dennis-lawter/yggdrassil-nixos.git
```

Within the config directory, you can now install one of the configurations:
```bash
sudo ./nix-ygg hvergelmir
```
Use the `-u` command to upgrade packages.
Once your hostname is set, you can exclude it from the nix-ygg args.
