{ pkgs ? import <nixpkgs> {} }:
let
  python-packages = ps: with ps; [
    pymunk
    ipython
    ipykernel
    pyqt5
    pip
    spyder-kernels
    pyls-spyder
    spyder
  ];
in
  
pkgs.mkShell {
  nativeBuildInputs = with pkgs.buildPackages; 
    [
      libsForQt5.oxygen
      (python310.withPackages python-packages)
    ];

# pip install didn't work out properly
# pip tries to uninstall the already installed QDarkStyle version, but isn't able to locate it due to nix
#
# TODO: try out mach.nix

shellHook = ''
  pip install QDarkStyle==3.0.2
  spyder -p .
'';

}
