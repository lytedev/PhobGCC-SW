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
  in {
    packages = forEachSupportedSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      phob-gcc-sw-rp2040 = pkgs.stdenv.mkDerivation {
        pname = "phob-gcc-sw-rp2040";
        version = "0.29";
        src = ./.;

        # buildPhase = ''
        #   runHook preBuild

        #   ls -la "$src"

        #   cp -r "$src/PhobGCC" ./
        #   ls -la .
        #   cd PhobGCC/rp2040
        #   mkdir -p build
        #   cd
        #   # make
        #   ls -la

        #   runHook postBuild
        # '';

        installPhase = ''
          ls -la .
        '';

        buildInputs = with pkgs; [
          pico-sdk
          cmake
          clang
        ];
      };

      default = self.outputs.packages.${system}.phob-gcc-sw-rp2040;
    });
    devShells = forEachSupportedSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      pico-dev = pkgs.mkShell {
        buildInputs = with pkgs; [
          pico-sdk
          cmake
          clang
        ];
      };

      default = self.outputs.devShells.${system}.pico-dev;
    });
  };
}
