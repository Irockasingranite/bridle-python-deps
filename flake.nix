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
    (flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        python = pkgs.python3Packages;
      in rec
      {
        formatter = pkgs.nixfmt-rfc-style;

        packages = rec {

          canalystii = python.callPackage ./packages/canalystii { };
          doxmlparser = python.callPackage ./packages/doxmlparser { };
          hdf5storage = python.callPackage ./packages/hdf5storage { };
          gs-usb = python.callPackage ./packages/gs-usb { };
          nixnet = python.callPackage ./packages/nixnet { };
          nrf-regtool = python.callPackage ./packages/nrf-regtool { inherit svada; };
          pydebuggerconfig = python.callPackage ./packages/pydebuggerconfig { inherit pyedbglib; };
          pyedbglib = python.callPackage ./packages/pyedbglib { };
          pykitinfo = python.callPackage ./packages/pykitinfo { inherit pydebuggerconfig pyedbglib; };
          pymcuprog = python.callPackage ./packages/pymcuprog { inherit pyedbglib; };
          python-can = python.callPackage ./packages/python-can {
            inherit
              canalystii
              gs-usb
              nixnet
              python-can-remote
              python-can-sontheim
              ;
          };
          python-can-remote = python.callPackage ./packages/python-can-remote { };
          python-can-sontheim = python.callPackage ./packages/python-can-sontheim { inherit python-can; };
          sphinx-tsn-theme = python.callPackage ./packages/sphinx-tsn-theme { };
          sphinxcontrib-svg2pdfconverter = python.callPackage ./packages/sphinxcontrib-svg2pdfconverter { };
          sphinx-csv-filter = python.callPackage ./packages/sphinx-csv-filter { };
          sphinx-lint = python.callPackage ./packages/sphinx-lint { };
          sphobjinv = python.callPackage ./packages/sphobjinv { };
          svada = python.callPackage ./packages/svada { };
        };

        checks = packages;
      }
    ));
}
