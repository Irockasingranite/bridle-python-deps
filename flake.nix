{
  description = "Python dependencies of bridle that aren't in nixpkgs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    let
      overlay = import ./overlay.nix;
    in
    (flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ overlay ];
        };
      in
      rec {
        formatter = pkgs.nixfmt-rfc-style;

        packages = {

          inherit (pkgs)
            deptry
            nrf-regtool
            sphinx-lint
            svada
            ;

          inherit (pkgs.python3Packages)
            hdf5storage
            lxml5
            pydebuggerconfig
            pyedbglib
            pykitinfo
            pymcuprog
            sphinx-tsn-theme
            sphinxcontrib-svg2pdfconverter
            sphinx-csv-filter
            sphobjinv
            ;
        };

        devShells.default = pkgs.callPackage ./shell.nix { };

        checks = packages;
      }
    ))
    // {
      overlays.default = overlay;
    };
}
