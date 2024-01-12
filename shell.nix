with import <nixpkgs> {};

(callPackage (fetchTarball https://github.com/DavHau/mach-nix/tarball/3.5.0) {}).mach-nix
