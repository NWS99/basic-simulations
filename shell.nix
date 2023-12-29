{ pkgs ? import <nixpkgs> {} }:
let
  python-packages = ps: with ps; [
    pymunk
    ipython
    ipykernel
    qdarkstyle
    pyqt5
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

shellHook = ''
  spyder -p .
'';

}
