# SPDX-FileCopyrightText: 2023 Technology Innovation Institute (TII)
#
# SPDX-License-Identifier: Apache-2.0
{
  pkgs ? import <nixpkgs> {},
}:

pkgs.writeShellApplication rec {
  name = "update-cpedict.sh";
  text = (builtins.readFile ./update-cpedict.sh);
  runtimeInputs = with pkgs; [ coreutils curl gnugrep gnused gzip ];
}
