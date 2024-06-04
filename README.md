# PhobGCC

Fork of https://github.com/PhobGCC/PhobGCC-SW

Adds a Nix Flake for easily building the firmware for flashing to RP2040-based
PhobGCC boards.

```
nix build
cp result/phobgcc_rp2040.uf2 /mnt
```

I intend to use this repo to hack around and see what sort of obnoxious things I
can build into the controller.
