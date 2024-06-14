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
      in
      {
        formatter = pkgs.nixfmt-rfc-style;

        packages = rec {

          bz = python.callPackage ./packages/bz { };
          canalystii = python.callPackage ./packages/canalystii { };
          cantact = python.callPackage ./packages/cantact { };
          doxmlparser = python.callPackage ./packages/doxmlparser { };
          hdf5storage = python.callPackage ./packages/hdf5storage { };
          pydebuggerconfig = python.callPackage ./packages/pydebuggerconfig { inherit pyedbglib; };
          pyedbglib = python.callPackage ./packages/pyedbglib { };
          pykitinfo = python.callPackage ./packages/pykitinfo { inherit pydebuggerconfig pyedbglib; };
          pymcuprog = python.callPackage ./packages/pymcuprog { inherit pyedbglib; };
          sphinx-tsn-theme = python.callPackage ./packages/sphinx-tsn-theme { };
          sphinxcontrib-svg2pdfconverter = python.callPackage ./packages/sphinxcontrib-svg2pdfconverter { };
          sphinx-csv-filter = python.callPackage ./packages/sphinx-csv-filter { };
        };
      }
    ));
}
