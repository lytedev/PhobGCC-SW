{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"

      "x86_64-darwin"
      "aarch64-darwin"
    ];

    forEachSupportedSystem = nixpkgs.lib.genAttrs supportedSystems;

    overlay = final: prev: {
      pico-sdk = prev.pico-sdk.overrideAttrs (oldAttrs: let
        version = "1.5.1";
      in {
        pname = "pico-sdk";
        inherit version;
        src = final.fetchFromGitHub {
          fetchSubmodules = true; # we need tinyusb: https://github.com/NixOS/nixpkgs/issues/175297
          owner = "raspberrypi";
          repo = "pico-sdk";
          rev = version;
          hash = "sha256-GY5jjJzaENL3ftuU5KpEZAmEZgyFRtLwGVg3W1e/4Ho=";
        };
      });
    };

    nixpkgsFor = system: ((import nixpkgs {inherit system;}).extend overlay);
  in {
    packages = forEachSupportedSystem (system: let
      pkgs = nixpkgsFor system;
    in {
      phob-gcc-sw-rp2040 = pkgs.callPackage ./package.nix {};
      default = self.outputs.packages.${system}.phob-gcc-sw-rp2040;
    });
  };
}
