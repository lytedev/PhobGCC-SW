{
  python3,
  stdenv,
  cmake,
  pico-sdk,
  gcc-arm-embedded,
}:
stdenv.mkDerivation rec {
  pname = "phob-gcc-sw-rp2040";
  version = "0.29.2";
  src = ./.;

  PICO_SDK_PATH = "${pico-sdk.out}/lib/pico-sdk";
  dontUseCmakeConfigure = true;

  buildPhase = ''
    cmake .
    ls -la
    make
  '';

  installPhase = ''
    mkdir $out
    ls -la .
    cp phobgcc_rp2040.uf2 $out
  '';

  nativeBuildInputs = [
    python3
    cmake
    gcc-arm-embedded
  ];
}
