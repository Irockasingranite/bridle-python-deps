{ pkgs }:
pkgs.mkShell {

  packages = with pkgs; [
    nrf-regtool
    svada
    (python3.withPackages (
      ps: with ps; [
        pydebuggerconfig
        pykitinfo
        sphinx-tsn-theme
        sphinx-csv-filter
        sphinx-filter-tabs
        sphobjinv
      ]
    ))
  ];
}
