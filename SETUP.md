# Setup Guide

These steps are for reproducability on setting up NixOS on future devices.

I'd like to replace as much of this as possible with a bash script,
but for now these steps will do.

## Physical Setup steps
1. Install NixOS via a thumb drive.
2. On the device:
3. `sudo nano /etc/nixos/configuration.nix`:
    - enable `services.openssh.enable = true;`
    - set `network.hostName = "nixos";` to something else
    - add `git` below the `#wget` line
4. Run `sudo nixos-rebuild switch`
5. Run `sudo reboot` to get the hostname applied

## Convenience
For some setups, it may be convenient to download this file locally:

`curl https://raw.githubusercontent.com/dennis-lawter/yggdrassil-nixos/refs/heads/main/SETUP.md`

## Repo access steps
1. Generate the machine's identity file: `ssh-keygen -t ed25519 -C "${USER}@${HOSTNAME}"`
2. Generate the yggdrassil access: `ssh-keygen -t ed25519 -C "${HOSTNAME}#yggdrassil" -f ~/.ssh/yggdrassil`
3. View the yggdrassil public key: `cat ~/.ssh/yggdrassil.pub`
4. https://github.com/dennis-lawter/yggdrassil-nixos/settings/keys/new
5. Enable write access.

## Git Identity
```bash
git config --global user.email "bytomancer@gmail.com"
git config --global user.name "Bytomancer"
```

## Clone Ygg
1. `cd ~`
2. `GIT_SSH_COMMAND="ssh -i ~/.ssh/yggdrassil -o IdentitiesOnly=yes" && git clone git@github.com:dennis-lawter/yggdrassil-nixos.git`
3. `cd yggdrassil-nixos`
4. Assuming this is a new install: `mkdir hosts/${HOSTNAME}`
5. Assuming we need to set/update the hardware spec: `cp /etc/nixos/hardware-configuration.nix hosts/${HOSTNAME}`
6. `git add .`
7. `git commit -m "${HOSTNAME} init"`
8. `git push`

## Setup config
At this point it's easiest to pull from a development environment and write the configs.

## Pull config and apply
```bash
cd ~/yggdrassil-nixos`
git pull
sudo ./nix-ygg
```
