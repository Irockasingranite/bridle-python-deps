{
  description = "Python dependencies of bridle that aren't in nixpkgs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    cache-nix-action = {
      url = "github:nix-community/cache-nix-action";
      flake = false;
    };

    systems.url = "github:nix-systems/default";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-utils,
      cache-nix-action,
      systems,
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
        lib = nixpkgs.lib;
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
            doxmlparser
            hdf5storage
            pydebuggerconfig
            pyedbglib
            pykitinfo
            pymcuprog
            sphinx-tsn-theme
            sphinxcontrib-svg2pdfconverter
            sphinx-csv-filter
            sphobjinv
            ;

          inherit
            (import "${inputs.cache-nix-action}/saveFromGC.nix" {
              inherit pkgs inputs;
              inputsExclude = [
                # the systems input will still be saved
                # because flake-utils needs it
                inputs.systems
              ];
              # Needs to be a list
              derivations = lib.attrsets.mapAttrsToList (name: _: name) packages;
            })
            saveFromGC
            ;
        };

        checks = packages;
      }
    ))
    // {
      overlays.default = overlay;
    };
}
