with import <nixpkgs> {};

(python3.buildEnv.override {
  extraLibs = with python3Packages; [
    pymunk
    ipython
    ipykernel
    pyqt5
    pip
    spyder-kernels
    pyls-spyder
    spyder
  ];
}).env

pkgs.mkShell {

# pip install didn't work out properly
# pip tries to uninstall the already installed QDarkStyle version, but isn't able to locate it due to nix
#
# TODO: try out mach.nix

shellHook = ''
  pip install QDarkStyle==3.0.2
  spyder -p .
'';

}
