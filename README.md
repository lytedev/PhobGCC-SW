# Falco Multishine PhobGCC Firmware

To build this PhobGCC firmware for the RP2040:

1. [Install `nix`][install-nix] (or use a `nix` Docker container)
2. Clone this repo, `cd` into it, run `nix build`
3. [Flash your controller with the resulting `./result/phobgcc_rp2040.uf2`
   file][flash]

If you're running Linux this can be done by running the following:

```shell
sudo mkdir -p /mnt
sudo mount /dev/disk/by-label/RPI-RP2 /mnt
sudo cp ./phobgcc_rp2040.uf2 /mnt
sudo sync
sudo umount /mnt do
```

# Usage

It's a normal Phob except you can press Right on the D-Pad to multishine as
Falco.

Don't do this in ranked matches or in tournaments. <3

[install-nix]: https://zero-to-nix.com/start/install
[flash]: https://github.com/PhobGCC/PhobGCC-doc/blob/main/For_Users/Phob2_Programming_Guide.md
