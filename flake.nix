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
        };
        pkgs-overlaid = import nixpkgs {
          inherit system;
          overlays = [ overlay ];
        };
      in
      rec {
        formatter = pkgs.nixfmt;

        packages = {

          inherit (pkgs-overlaid)
            deptry
            nrf-regtool
            sphinx-lint
            svada
            ;

          inherit (pkgs-overlaid.python3Packages)
            docutils
            hdf5storage
            pydebuggerconfig
            pyedbglib
            pykitinfo
            pymcuprog
            sphinx
            sphinx-tsn-theme
            sphinxcontrib-svg2pdfconverter
            sphinx-csv-filter
            sphinx-filter-tabs
            sphobjinv
            ;
        };

        devShells = {
          default = pkgs.mkShell {
            packages = with pkgs; [
              nix-init
              nix-update
              (python3.withPackages (ps: [ ps.packaging ]))
              nixfmt
              nixfmt-tree
            ];
          };
          all-packages = pkgs-overlaid.callPackage ./all-packages-shell.nix { };
        };

        checks = packages;
      }
    ))
    // {
      overlays.default = overlay;
    };
}
