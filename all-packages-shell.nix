{ pkgs }:
pkgs.mkShell {

  packages = with pkgs; [
    deptry
    nrf-regtool
    sphinx-lint
    svada
    (python3.withPackages (
      ps: with ps; [
        hdf5storage
        pydebuggerconfig
        pyedbglib
        pykitinfo
        pymcuprog
        sphinx-tsn-theme
        sphinxcontrib-svg2pdfconverter
        sphinx-csv-filter
        sphinx-filter-tabs
        sphobjinv
      ]
    ))
  ];
}
