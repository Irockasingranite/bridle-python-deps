{ pkgs }:
pkgs.mkShell {

  packages = with pkgs; [
    deptry
    nrf-regtool
    sphinx-lint
    svada
    (python3.withPackages (
      ps: with ps; [
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
      ]
    ))
  ];
}
