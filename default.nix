{ config ? { }, lib ? { }, pkgs ? import <nixpkgs> { }, ... }:

let
  ovrAdvancedSettings = pkgs.qt5.mkDerivation {
    pname = "OpenVR-AdvancedSettings";
    version = "5.2.2";
    src = ./.;
    buildInputs = [
      pkgs.libglvnd
      pkgs.libpulseaudio
      pkgs.qt5.full
      pkgs.qt5.qmake
      pkgs.xorg.libX11
      pkgs.xorg.libXt
      pkgs.xorg.libXtst
      pkgs.xorg.libxcb
    ];

    NIX_CFLAGS_COMPILE =
      "-Wno-error=conversion -Wno-error=zero-as-null-pointer-constant";

    preFixup = ''
      wrapQtApp $out/AdvancedSettings/AdvancedSettings
    '';
  };
in ovrAdvancedSettings
