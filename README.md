# Falco Multishine PhobGCC Firmware

This is custom PhobGCC firmware that performs a Falco "multishine" macro (rather
inconsistently) when the D-Pad Right button is held down.

## Why

Mostly for fun.

Also, recently there were some folks that seemed to think this was not possible
with a Phob and I wanted to make it clear that they (and all controllers) are
fully programmable and can do stuff like this. My hope is that this brings some
concrete clarity to the ongoing discussion related to controllers especially as
it pertains to competitive games and Super Smash Bros. Melee.

## Download

See the [latest release](./releases).

## Build

To build this PhobGCC firmware for the RP2040:

- [Install `nix`][install-nix] (or use a `nix` Docker container)
- Clone this repo, `cd` into it, run `nix build`

Your `./result/phobgcc_rp2040.uf2` should now be there.

## Flashing

Flashing intructions are here: https://github.com/PhobGCC/PhobGCC-doc/blob/main/For_Users/Phob2_Programming_Guide.md

If you're running Linux this can be done by running the following after plugging
the PhobGCC in while holding reset/start:

```shell
sudo mkdir -p /mnt
sudo mount /dev/disk/by-label/RPI-RP2 /mnt
sudo cp ./phobgcc_rp2040.uf2 /mnt
sudo sync
sudo umount /mnt do
```

## Usage

It's a normal Phob except you can press Right on the D-Pad to multishine as
Falco.

Don't do this in ranked matches or in tournaments. <3

[install-nix]: https://zero-to-nix.com/start/install
[flash]: https://github.com/PhobGCC/PhobGCC-doc/blob/main/For_Users/Phob2_Programming_Guide.md
