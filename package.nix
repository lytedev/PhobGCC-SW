{
  python3,
  stdenv,
  cmake,
  pico-sdk,
  gcc-arm-embedded,
}:
stdenv.mkDerivation {
  pname = "phob-gcc-sw-rp2040";
  version = "0.29.2";
  src = ./PhobGCC;

  PICO_SDK_PATH = "${pico-sdk.out}/lib/pico-sdk";
  dontUseCmakeConfigure = true;

  buildPhase = ''
    cmake rp2040
    make
  '';

  installPhase = ''
    mkdir $out
    cp phobgcc_rp2040.uf2 $out
  '';

  nativeBuildInputs = [
    python3
  ];

  buildInputs = [
    cmake
    gcc-arm-embedded
  ];
}
