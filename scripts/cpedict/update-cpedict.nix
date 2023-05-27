# SPDX-FileCopyrightText: 2023 Technology Innovation Institute (TII)
#
# SPDX-License-Identifier: Apache-2.0
{
  pkgs ? import <nixpkgs> {},
}:

pkgs.stdenv.mkDerivation rec {
  doCheck = true;
  pname = "update-cpedict.sh";
  version = pkgs.lib.removeSuffix "\n" (builtins.readFile ../../VERSION);
  src = ./update-cpedict.sh;

  checkInputs = [ pkgs.shellcheck ];
  buildInputs = [ pkgs.bash ];
  propagatedBuildInputs = with pkgs; [ coreutils curl gnugrep gnused gzip ];
  unpackPhase = ''
    cp ${src} ${pname}
  '';
  checkPhase = ''
    shellcheck ${pname}
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp ${pname} $out/bin/${pname}
    chmod +x $out/bin/${pname}
  '';
}
